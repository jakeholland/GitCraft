//
//  MockIssue.swift
//  GitCraftTests
//
//  Created by Jacob Holland on 3/21/20.
//  Copyright © 2020 Jacob Holland. All rights reserved.
//

import GitHubService

struct MockIssue: Issue {
    let id: Int
    let number: Int
    let title: String
    let body: String
    let date: Date
    let lastUpdated: Date
    
    init(id: Int = -1,
         number: Int = 1,
         title: String = "Stuff is broken",
         body: String = "",
         date: Date = .distantPast,
         lastUpdated: Date = Date.distantPast.addingTimeInterval(3600)) {
        self.id = id
        self.number = number
        self.title = title
        self.body = body
        self.date = date
        self.lastUpdated = lastUpdated
    }
}
