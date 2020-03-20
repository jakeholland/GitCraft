//
//  GitHubServiceProtocol.swift
//  GitHubService
//
//  Created by Jacob Holland on 3/20/20.
//  Copyright © 2020 Jacob Holland. All rights reserved.
//

import Foundation

public protocol GitHubServiceProtocol {
    func getRepositories(for username: String, completion: @escaping (Result<[Repository], Error>) -> Void)
}
