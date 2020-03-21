//
//  GitHubRepository.swift
//  GitHubService
//
//  Created by Jacob Holland on 3/20/20.
//  Copyright © 2020 Jacob Holland. All rights reserved.
//

import Foundation

struct GitHubRepository: Repository {
    let name: String
    let description: String?
    let owner: String
    let forkCount: Int
    let starCount: Int
    let watchCount: Int
    let openIssueCount: Int
    let hasIssues: Bool
    
    init(from repositoryResponse: RepositoryResponse) {
        name = repositoryResponse.name
        description = repositoryResponse.description
        owner = repositoryResponse.owner.login
        forkCount = repositoryResponse.forks_count
        starCount = repositoryResponse.stargazers_count
        watchCount = repositoryResponse.watchers_count
        openIssueCount = repositoryResponse.open_issues_count
        hasIssues = repositoryResponse.has_issues
    }
}
