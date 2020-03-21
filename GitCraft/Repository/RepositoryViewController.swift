//
//  RepositoryViewController.swift
//  GitCraft
//
//  Created by Jacob Holland on 3/20/20.
//  Copyright © 2020 Jacob Holland. All rights reserved.
//

import GitHubService
import UIKit

final class RepositoryViewController: UIViewController {
    
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.isHidden = descriptionLabel.text == nil
        }
    }
    @IBOutlet private var watchersLabel: UILabel!
    @IBOutlet private var starsLabel: UILabel!
    @IBOutlet private var forksLabel: UILabel!
    @IBOutlet private var issuesButton: UIButton!
    
    private var viewModel: RepositoryViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let issuesViewController = segue.destination as? IssuesViewController
            else { return }
        
        issuesViewController.configure(for: viewModel.repository)
    }
    
    func configure(for repository: Repository) {
        viewModel = RepositoryViewModel(repository: repository)
    }
}

private extension RepositoryViewController {
    func setup() {
        nameLabel.text = viewModel.name
        descriptionLabel.text = viewModel.description
        watchersLabel.text = viewModel.watchersText
        starsLabel.text = viewModel.starsText
        forksLabel.text = viewModel.forksText
        issuesButton.setTitle( viewModel.issuesText, for: .normal)
    }
}
