//
//  Issue.swift
//  GitHubService
//
//  Created by Jacob Holland on 3/20/20.
//  Copyright © 2020 Jacob Holland. All rights reserved.
//

import Foundation

public struct Issue {
    public let id: Int
    public let number: Int
    public let title: String
    public let body: String
    public let date: Date
    public let lastUpdated: Date
}

extension Issue {
    init(from issueResponse: IssueResponse) {
        id = issueResponse.id
        number = issueResponse.number
        title = issueResponse.title
        body = issueResponse.body
        date = issueResponse.created_at
        lastUpdated = issueResponse.updated_at
    }
}
