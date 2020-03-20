//
//  GitHubError.swift
//  GitHubService
//
//  Created by Jacob Holland on 3/20/20.
//  Copyright © 2020 Jacob Holland. All rights reserved.
//

import Foundation

enum GitHubError: Error {
    case unknown
    case decoding
}

extension GitHubError: LocalizedError {
    var errorDescription: String? { nil }
}
