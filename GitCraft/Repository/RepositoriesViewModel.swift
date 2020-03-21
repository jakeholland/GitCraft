//
//  RepositoriesViewModel.swift
//  GitCraft
//
//  Created by Jacob Holland on 3/20/20.
//  Copyright © 2020 Jacob Holland. All rights reserved.
//

import GitHubService

final class RepositoriesViewModel {
    
    let username: String
    var numberOfRespositories: Int { repositories.count }
    
    private let gitHubService: GitHubServiceProtocol
    private var repositories: [Repository] = []
    
    init(username: String, gitHubService: GitHubServiceProtocol = GitHubService()) {
        self.username = username
        self.gitHubService = gitHubService
    }
    
    func getRepositories(success: @escaping () -> Void, failure: @escaping (Error) -> Void) {
        gitHubService.getRepositories(for: username) { [weak self] result in
            switch result {
            case .success(let repositories):
                self?.repositories = repositories
                success()
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    func repository(at index: Int) -> Repository? {
        repositories[safe: index]
    }
    
}
