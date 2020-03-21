//
//  Repository.swift
//  GitHubService
//
//  Created by Jacob Holland on 3/21/20.
//  Copyright © 2020 Jacob Holland. All rights reserved.
//

public protocol Repository {
    var name: String { get }
    var description: String? { get }
    var owner: String { get }
    var forkCount: Int { get }
    var starCount: Int { get }
    var watchCount: Int { get }
    var issueCount: Int { get }
}
