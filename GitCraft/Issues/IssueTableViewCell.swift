//
//  IssueTableViewCell.swift
//  GitCraft
//
//  Created by Jacob Holland on 3/20/20.
//  Copyright © 2020 Jacob Holland. All rights reserved.
//

import GitHubService
import UIKit

final class IssueTableViewCell: UITableViewCell {
    
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    
    private(set) var issue: Issue!
    
    func configure(for issue: Issue) {
        self.issue = issue
        nameLabel.text = "#\(issue.number) - \(issue.title)"
        descriptionLabel.text = issue.body
    }
}

extension IssueTableViewCell: Reusable { }

