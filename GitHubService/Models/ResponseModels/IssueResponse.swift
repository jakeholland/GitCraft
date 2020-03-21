//
//  IssueResponse.swift
//  GitHubService
//
//  Created by Jacob Holland on 3/20/20.
//  Copyright © 2020 Jacob Holland. All rights reserved.
//

import Foundation

struct IssueResponse: Codable {
    let id: Int
    let node_id: String
    let url: String
    let repository_url: String
    let labels_url: String
    let comments_url: String
    let events_url: String
    let html_url: String
    let number: Int
    let state: String
    let title: String
    let body: String
    let user: Assignee
    let labels: [Label]
    let assignee: Assignee?
    let assignees: [Assignee]
    let milestone: Milestone?
    let locked: Bool
    let active_lock_reason: String?
    let comments: Int
    let pull_request: PullRequest?
    let closed_at: Date?
    let created_at: Date
    let updated_at: Date
}

struct Assignee: Codable {
    let login: String
    let id: Int
    let node_id: String
    let avatar_url: String
    let gravatar_id: String
    let url: String
    let html_url: String
    let followers_url: String
    let following_url: String
    let gists_url: String
    let starred_url: String
    let subscriptions_url: String
    let organizations_url: String
    let repos_url: String
    let events_url: String
    let received_events_url: String
    let type: String
    let site_admin: Bool
}

struct Label: Codable {
    let id: Int
    let node_id: String
    let url: String
    let name: String
    let label_description: String?
    let color: String
    let label_default: Bool?
}

struct Milestone: Codable {
    let url: String
    let html_url: String
    let labels_url: String
    let id: Int
    let node_id: String
    let number: Int
    let state: String
    let title: String
    let milestone_description: String?
    let creator: Assignee
    let open_issues: Int
    let closed_issues: Int
    let created_at: Date
    let updated_at: Date
    let closed_at: Date?
    let due_on: Date
}

struct PullRequest: Codable {
    let url: String
    let html_url: String
    let diff_url: String
    let patch_url: String
}
