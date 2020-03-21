//
//  RepositoriyViewModel.swift
//  GitCraft
//
//  Created by Jacob Holland on 3/20/20.
//  Copyright © 2020 Jacob Holland. All rights reserved.
//

import GitHubService

final class RepositoryViewModel {
    
    let repository: Repository
    
    var name: String { repository.name }
    var description: String? { repository.description }
    var watchersText: String { "\(repository.watchCount) Watchers"}
    var starsText: String { "\(repository.starCount) Stars"}
    var forksText: String { "\(repository.forkCount) Forks"}
    var issuesText: String { "Issues (\(repository.issueCount))"}
    var hasIssues: Bool { repository.issueCount > 0 }
    
    private let gitHubService: GitHubServiceProtocol
    
    init(repository: Repository, gitHubService: GitHubServiceProtocol = GitHubService()) {
        self.repository = repository
        self.gitHubService = gitHubService
    }
}
