//
//  RepositoryViewController.swift
//  GitCraft
//
//  Created by Jacob Holland on 3/20/20.
//  Copyright © 2020 Jacob Holland. All rights reserved.
//

import UIKit

final class RepositoryViewController: UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    
    private let viewModel = RepositoryViewModel(username: "intuit")

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getRepositories()
    }
}

extension RepositoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRespositories
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let repository = viewModel.repository(at: indexPath.row),
            let repositoryTableViewCell = tableView.dequeueReusableCell(withIdentifier: RepositoryTableViewCell.reuseIdentifier, for: indexPath) as? RepositoryTableViewCell
            else { fatalError("Repository at \(indexPath.row) not found!") }
        
        repositoryTableViewCell.configure(for: repository)
        
        return repositoryTableViewCell
    }
}

extension RepositoryViewController: UITableViewDelegate {
    
}

private extension RepositoryViewController {
    func getRepositories() {
        viewModel.getRepositories(success: {
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
