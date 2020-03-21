//
//  MockRepository.swift
//  GitCraftTests
//
//  Created by Jacob Holland on 3/21/20.
//  Copyright © 2020 Jacob Holland. All rights reserved.
//

import GitHubService

struct MockRepository: Repository {
    let name: String
    let description: String?
    let owner: String
    let forkCount: Int
    let starCount: Int
    let watchCount: Int
    let openIssueCount: Int
    let hasIssues: Bool
    
    init(name: String = "My Cool Repo",
         description: String? = nil,
         owner: String = "johndoe",
         forkCount: Int = 0,
         starCount: Int = 0,
         watchCount: Int = 0,
         openIssueCount: Int = 0,
         hasIssues: Bool = false) {
        self.name = name
        self.description = description
        self.owner = owner
        self.forkCount = forkCount
        self.starCount = starCount
        self.watchCount = watchCount
        self.openIssueCount = openIssueCount
        self.hasIssues = hasIssues
    }
}
