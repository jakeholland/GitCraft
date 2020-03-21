//
//  IssueViewModel.swift
//  GitCraft
//
//  Created by Jacob Holland on 3/20/20.
//  Copyright © 2020 Jacob Holland. All rights reserved.
//

import GitHubService

struct IssueViewModel {
    
    let issue: Issue
    
    var title: String { issue.title }
    var body: String? { issue.body }
    var dateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a' on 'M/d/yyyy"
        return dateFormatter.string(from: issue.date)
    }
    
    private let gitHubService: GitHubServiceProtocol
    
    init(issue: Issue, gitHubService: GitHubServiceProtocol = GitHubService()) {
        self.issue = issue
        self.gitHubService = gitHubService
    }
}
