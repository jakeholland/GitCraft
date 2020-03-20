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
    public let forkCount: Int
    public let starCount: Int
    public let watchCount: Int
    public let issueCount: Int
}

extension Repository {
    init(from repositoryResponse: RepositoryResponse) {
        self.name = repositoryResponse.name
        self.description = repositoryResponse.description
        self.forkCount = repositoryResponse.forks_count
        self.starCount = repositoryResponse.stargazers_count
        self.watchCount = repositoryResponse.watchers_count
        self.issueCount = repositoryResponse.open_issues
    }
}
