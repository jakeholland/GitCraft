//
//  IssuesViewController.swift
//  GitCraft
//
//  Created by Jacob Holland on 3/20/20.
//  Copyright © 2020 Jacob Holland. All rights reserved.
//

import GitHubService
import UIKit

final class IssuesViewController: UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    
    private var viewModel: IssuesViewModel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getIssues()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let issueViewController = segue.destination as? IssueViewController,
            let issueTableViewCell = sender as? IssueTableViewCell
            else { return }
        
        issueViewController.configure(for: issueTableViewCell.issue)
    }
    
    func configure(for repository: Repository) {
        viewModel = IssuesViewModel(repository: repository)
    }
}

extension IssuesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfIssues
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let issue = viewModel.issue(at: indexPath.row),
            let issueTableViewCell = tableView.dequeueReusableCell(withIdentifier: IssueTableViewCell.reuseIdentifier, for: indexPath) as? IssueTableViewCell
            else { fatalError("Issue at \(indexPath.row) not found!") }
        
        issueTableViewCell.configure(for: issue)
        
        return issueTableViewCell
    }
}

private extension IssuesViewController {
    func getIssues() {
        viewModel.getIssues(success: {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }, failure: { error in
            DispatchQueue.main.async {
                self.presentError(error)
            }
        })
    }
}
