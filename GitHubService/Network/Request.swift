//
//  Request.swift
//  GitHubService
//
//  Created by Jacob Holland on 3/20/20.
//  Copyright © 2020 Jacob Holland. All rights reserved.
//

import Foundation

struct Request {
    let urlRequest: URLRequest
    let sessionManager: SessionManager
    private let jsonDecoder: JSONDecoder
    
    init(urlRequest: URLRequest, sessionManager: SessionManager) {
        self.urlRequest = urlRequest
        self.sessionManager = sessionManager
        jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
    }
    
    func responseData(_ completion: @escaping (Result<Data, Error>) -> Void) {
        sessionManager.responseData(urlRequest: urlRequest) { (data, response, error) in
            guard let data = data else {
                completion(.failure(error ?? GitHubError.unknown))
                return
            }
            completion(.success(data))
        }
    }

    func responseDecodable<T: Decodable>(_ completion: @escaping (Result<T, Error>) -> Void) {
        responseDecodable(T.self, completion)
    }
    
    func responseDecodable<T: Decodable>(_ type: T.Type, _ completion: @escaping (Result<T, Error>) -> Void) {
        responseData { result in
            switch result {
            case .success(let data):
                guard let decodable = try? self.jsonDecoder.decode(T.self, from: data) else {
                    completion(.failure(GitHubError.decoding))
                    return
                }
                completion(.success(decodable))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
}
