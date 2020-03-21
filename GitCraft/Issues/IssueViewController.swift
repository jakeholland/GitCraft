//
//  IssueViewController.swift
//  GitCraft
//
//  Created by Jacob Holland on 3/20/20.
//  Copyright © 2020 Jacob Holland. All rights reserved.
//

import GitHubService
import UIKit

final class IssueViewController: UIViewController {
    
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var dateLabel: UILabel!
    @IBOutlet private var bodyLabel: UILabel!
    @IBOutlet private var badgeImageView: UIImageView!
    @IBOutlet private var badgeLabel: UILabel!
    
    private var viewModel: IssueViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func configure(for issue: Issue) {
        viewModel = IssueViewModel(issue: issue)
    }
}

private extension IssueViewController {
    func setup() {
        titleLabel.text = viewModel.title
        bodyLabel.text = viewModel.body
        badgeImageView.image = viewModel.badgeImage
        badgeLabel.text = viewModel.badgeText
        dateLabel.text = viewModel.dateString
    }
}
