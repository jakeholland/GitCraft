//
//  MockGitHubService.swift
//  GitCraftTests
//
//  Created by Jacob Holland on 3/21/20.
//  Copyright © 2020 Jacob Holland. All rights reserved.
//

import GitHubService
import Foundation

final class MockGitHubService: GitHubServiceProtocol {
    
    var repositoriesErrorToReturn: Error?
    var repositoriesToReturn: [Repository] = []
    func getRepositories(for username: String, completion: @escaping (Result<[Repository], Error>) -> Void) {
        if let error = repositoriesErrorToReturn {
            completion(.failure(error))
        } else {
            completion(.success(repositoriesToReturn))
        }
    }

    var issuesErrorToReturn: Error?
    var issuesToReturn: [Issue] = []
    func getIssues(for username: String, in repository: String, completion: @escaping (Result<[Issue], Error>) -> Void) {
        if let error = issuesErrorToReturn {
            completion(.failure(error))
        } else {
            completion(.success(issuesToReturn))
        }
    }
}
