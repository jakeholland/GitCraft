//
//  IssuesViewModel.swift
//  GitCraft
//
//  Created by Jacob Holland on 3/20/20.
//  Copyright © 2020 Jacob Holland. All rights reserved.
//

import GitHubService

final class IssuesViewModel {
    
    let repository: Repository
    var numberOfIssues: Int { issues.count }
    
    private let gitHubService: GitHubServiceProtocol
    private var issues: [Issue] = []
    
    init(repository: Repository, gitHubService: GitHubServiceProtocol = GitHubService()) {
        self.repository = repository
        self.gitHubService = gitHubService
    }
    
    func getIssues(success: @escaping () -> Void, failure: @escaping (Error) -> Void) {
        gitHubService.getIssues(for: repository.owner, in: repository.name) { [weak self] result in
            switch result {
            case .success(let issues):
                self?.issues = issues
                success()
            case .failure(let error):
                failure(error)
            }
        }
   }
   
   func issue(at index: Int) -> Issue? {
        issues[safe: index]
   }
}
