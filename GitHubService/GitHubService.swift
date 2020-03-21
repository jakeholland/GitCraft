//
//  GitHubService.swift
//  GitHubService
//
//  Created by Jacob Holland on 3/20/20.
//  Copyright © 2020 Jacob Holland. All rights reserved.
//

import Foundation

public struct GitHubService: GitHubServiceProtocol {
    private let sessionManager: SessionManager
        
    public init(sessionManager: SessionManager = URLSessionManager()) {
        self.sessionManager = sessionManager
    }
    
    public func getRepositories(for username: String, completion: @escaping (Result<[Repository], Error>) -> Void) {
        let components: RepositoryRouter = .getRepositories(username: username, type: .all, sort: .created, sortDirection: .asc)
        let request = Request(urlRequest: components.urlRequest, sessionManager: sessionManager)
         
        request.responseDecodable([RepositoryResponse].self) { result in
            switch result {
            case .success(let repositoryResponseArray):
                let repositories = repositoryResponseArray.map { GitHubRepository(from: $0)}
                completion(.success(repositories))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
    public func getIssues(for username: String, in repository: String, completion: @escaping (Result<[Issue], Error>) -> Void) {
        let components: IssueRouter = .getIssues(username: username, repo: repository, state: .all)
        let request = Request(urlRequest: components.urlRequest, sessionManager: sessionManager)
         
        request.responseDecodable([IssueResponse].self) { result in
            switch result {
            case .success(let issueResponseArray):
                let issues = issueResponseArray.map { GitHubIssue(from: $0) }
                completion(.success(issues))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
}
