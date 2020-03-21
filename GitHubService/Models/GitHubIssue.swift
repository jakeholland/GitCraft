//
//  GitHubIssue.swift
//  GitHubService
//
//  Created by Jacob Holland on 3/20/20.
//  Copyright © 2020 Jacob Holland. All rights reserved.
//

import Foundation

struct GitHubIssue: Issue {
    let id: Int
    let number: Int
    let title: String
    let body: String
    let date: Date
    let lastUpdated: Date

    init(from issueResponse: IssueResponse) {
        id = issueResponse.id
        number = issueResponse.number
        title = issueResponse.title
        body = issueResponse.body
        date = issueResponse.created_at
        lastUpdated = issueResponse.updated_at
    }
}
