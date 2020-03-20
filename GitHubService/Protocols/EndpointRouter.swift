//
//  EndpointRouter.swift
//  GitHubService
//
//  Created by Jacob Holland on 3/20/20.
//  Copyright © 2020 Jacob Holland. All rights reserved.
//

import Foundation

protocol EndpointRouter {
    var components: RequestComponents { get }
    var urlRequest: URLRequest { get }
}

extension EndpointRouter {
    func addQueries(_ queries: Parameters, to urlRequest: URLRequest) -> URLRequest {
        guard
            let urlString = urlRequest.url?.absoluteString,
            var urlComponents = URLComponents(string: urlString)
            else { return urlRequest }

        urlComponents.queryItems = queries.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        urlComponents.percentEncodedQuery = urlComponents.percentEncodedQuery

        guard let url = urlComponents.url else { return urlRequest }

        return URLRequest(url: url)
    }
}

extension Parameters {
    var queryItems: [URLQueryItem] { return compactMap { URLQueryItem(name: $0.key, value: "\($0.value)") } }
}
