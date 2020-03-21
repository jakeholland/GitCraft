//
//  GitHubEndpointRouter.swift
//  GitHubService
//
//  Created by Jacob Holland on 3/20/20.
//  Copyright © 2020 Jacob Holland. All rights reserved.
//

import Foundation

protocol GitHubEndpointRouter: EndpointRouter { }

extension GitHubEndpointRouter {
    var urlRequest: URLRequest {
        guard let baseUrl = URL(string: "https://api.github.com") else { fatalError("Invalid URL") }
        let url = baseUrl.appendingPathComponent(components.path)
        
        guard
            let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true),
            let urlWithComponents = urlComponents.url
            else { fatalError("Invalid URL") }

        var urlRequest = URLRequest(url: urlWithComponents)
        urlRequest.httpMethod = components.method.rawValue
        
        if let params = components.body {
             urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: params)
        }
        
        if let queries = components.queries {
            urlRequest = addQueries(queries, to: urlRequest)
        }
       
        urlRequest.addValue("Accept: application/vnd.github.v3+json", forHTTPHeaderField: "Accept")
        urlRequest.addValue("GitCraft", forHTTPHeaderField: "User-Agent")
        
        return urlRequest
    }
}
