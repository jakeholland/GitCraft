//
//  RepositoriesViewController.swift
//  GitCraft
//
//  Created by Jacob Holland on 3/20/20.
//  Copyright © 2020 Jacob Holland. All rights reserved.
//

import UIKit

final class RepositoriesViewController: UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    
    private let viewModel = RepositoriesViewModel(username: "intuit")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.username
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getRepositories()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let repositoryViewController = segue.destination as? RepositoryViewController,
            let repositoryTableViewCell = sender as? RepositoryTableViewCell
            else { return }
        
        repositoryViewController.configure(for: repositoryTableViewCell.repository)
    }
}

extension RepositoriesViewController: UITableViewDataSource {
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

private extension RepositoriesViewController {
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
