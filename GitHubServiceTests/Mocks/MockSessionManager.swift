//
//  MockSessionManager.swift
//  GitHubServiceTests
//
//  Created by Jacob Holland on 3/21/20.
//  Copyright © 2020 Jacob Holland. All rights reserved.
//

import Foundation
@testable import GitHubService

final class MockSessionManager: SessionManager {

    private var stubs: [Stub] = []

    init() { }

    func responseData(urlRequest: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        guard
            let url = urlRequest.url,
            let method = HTTPMethod(from: urlRequest.httpMethod),
            let stub = stubs.first(where: { url.relativePath.hasSuffix($0.url) && $0.method == method })
            else { fatalError("Stub not found!") }

        let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)
        let data = jsonData(for: stub.fixture)
        completion(data, response, nil)
    }

    func add(_ stub: Stub) {
        stubs.append(stub)
    }

    func removeAll() {
        stubs.removeAll()
    }

    private func jsonData(for fixture: String) -> Data {
        guard
            let path = Bundle(for: Self.self).path(forResource: fixture, ofType: "json"),
            let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path))
            else { fatalError("Fixture not found!") }

        return jsonData
    }
}
