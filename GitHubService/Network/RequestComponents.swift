//
//  RequestComponents.swift
//  GitHubService
//
//  Created by Jacob Holland on 3/20/20.
//  Copyright © 2020 Jacob Holland. All rights reserved.
//

struct RequestComponents {
    let method: HTTPMethod
    let path: String
    let body: Parameters?
    let queries: Parameters?
    
    init(method: HTTPMethod, path: String, params: Parameters? = nil, queries: Parameters? = nil) {
        self.method = method
        self.path = path
        self.body = params
        self.queries = queries
    }
}
 
