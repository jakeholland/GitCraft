//
//  Repository.swift
//  GitHubService
//
//  Created by Jacob Holland on 3/20/20.
//  Copyright © 2020 Jacob Holland. All rights reserved.
//

import Foundation

public struct Repository {
    public let name: String
    public let description: String?
    public let owner: String
    public let forkCount: Int
    public let starCount: Int
    public let watchCount: Int
    public let issueCount: Int
}

extension Repository {
    init(from repositoryResponse: RepositoryResponse) {
        name = repositoryResponse.name
        description = repositoryResponse.description
        owner = repositoryResponse.owner.login
        forkCount = repositoryResponse.forks_count
        starCount = repositoryResponse.stargazers_count
        watchCount = repositoryResponse.watchers_count
        issueCount = repositoryResponse.open_issues
    }
}
