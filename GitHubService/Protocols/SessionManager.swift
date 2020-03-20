//
//  SessionManager.swift
//  GitHubService
//
//  Created by Jacob Holland on 3/20/20.
//  Copyright © 2020 Jacob Holland. All rights reserved.
//

import Foundation

public protocol SessionManager {
    func responseData(urlRequest: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void)
}
