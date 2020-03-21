//
//  HttpMockingTestCase.swift
//  GitHubServiceTests
//
//  Created by Jacob Holland on 3/21/20.
//  Copyright © 2020 Jacob Holland. All rights reserved.
//

@testable import GitHubService
import XCTest

class HttpMockingTestCase: XCTestCase {
    let mockSessionManager = MockSessionManager()

    override open func tearDown() {
        mockSessionManager.removeAll()
        super.tearDown()
    }
}

extension HTTPMethod {
    init?(from string: String?) {
        switch string {
        case "GET":
            self = .get
        case "POST":
            self = .post
        case "PUT":
            self = .put
        case "DELETE":
            self = .delete
        default:
            return nil
        }
    }
}

extension HttpMockingTestCase {
    func stub(_ httpMethod: HTTPMethod, _ url: String, fixture: String) {
        let stub = Stub(url: url, method: httpMethod, fixture: fixture)
        mockSessionManager.add(stub)
    }

}
