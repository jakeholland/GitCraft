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
    let issueCount: Int
    
    init(name: String = "My Cool Repo",
         description: String? = nil,
         owner: String = "johndoe",
         forkCount: Int = 0,
         starCount: Int = 0,
         watchCount: Int = 0,
         issueCount: Int = 0) {
        self.name = name
        self.description = description
        self.owner = owner
        self.forkCount = forkCount
        self.starCount = starCount
        self.watchCount = watchCount
        self.issueCount = issueCount
    }
}
