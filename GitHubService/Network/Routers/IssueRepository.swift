//
//  IssueRepository.swift
//  GitHubService
//
//  Created by Jacob Holland on 3/20/20.
//  Copyright © 2020 Jacob Holland. All rights reserved.
//

enum IssueRouter: GitHubEndpointRouter {

    //https://developer.github.com/v3/issues/#list-repository-issues
    case getIssues(username: String, repo: String, state: IssueState)

    var components: RequestComponents {
        switch self {
        case .getIssues(let username, let repo, let state):
            let queries: Parameters = [
                "milestone": "*",
                "state": state.rawValue,
                "assignee": "*"
            ]

            return RequestComponents(method: .get, path: "repos/\(username)/\(repo)/issues", queries: queries)
        }
    }
}
