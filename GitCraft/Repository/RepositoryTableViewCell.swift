//
//  RepositoryTableViewCell.swift
//  GitCraft
//
//  Created by Jacob Holland on 3/20/20.
//  Copyright © 2020 Jacob Holland. All rights reserved.
//

import GitHubService
import UIKit

final class RepositoryTableViewCell: UITableViewCell {
    
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.isHidden = descriptionLabel.text == nil
        }
    }
    
    private(set) var repository: Repository!
    
    func configure(for repository: Repository) {
        self.repository = repository
        nameLabel.text = repository.name
        descriptionLabel.text = repository.description
    }
}

extension RepositoryTableViewCell: Reusable { }
