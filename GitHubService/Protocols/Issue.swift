//
//  Issue.swift
//  GitHubService
//
//  Created by Jacob Holland on 3/21/20.
//  Copyright © 2020 Jacob Holland. All rights reserved.
//

import Foundation

public protocol Issue {
    var id: Int { get }
    var number: Int { get }
    var title: String { get }
    var body: String { get }
    var date: Date { get }
    var lastUpdated: Date { get }
    var isClosed: Bool { get }
}
