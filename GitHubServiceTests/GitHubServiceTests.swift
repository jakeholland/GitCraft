//
//  GitHubServiceTests.swift
//  GitHubServiceTests
//
//  Created by Jacob Holland on 3/20/20.
//  Copyright © 2020 Jacob Holland. All rights reserved.
//

@testable import GitHubService
import XCTest

final class GitHubServiceTests: HttpMockingTestCase {

    private lazy var gitHubService = GitHubService(sessionManager: mockSessionManager)

    func testGetRepositoryForUser() {
        let expectation = XCTestExpectation(description: "Get repos for user")
        let username = "test"
        
        stub(.get, "users/\(username)/repos", fixture: "repositories")
        
        gitHubService.getRepositories(for: username) { result in
            defer { expectation.fulfill() }
            guard case let .success(repositories) = result else {
                XCTFail("Unexpected Failure")
                return
            }
            
            XCTAssertEqual(repositories.count, 1)
            XCTAssertEqual(repositories.first?.name, "Hello-World")
            XCTAssertEqual(repositories.first?.description, "This your first repo!")
            XCTAssertEqual(repositories.first?.owner, "octocat")
        }
        
        wait(for: [expectation], timeout: 5)
    }

    func testGetIssuesForRepository() {
        let expectation = XCTestExpectation(description: "Get issues for repository")
        let username = "username"
        let repo = "repo"
        
        stub(.get, "repos/\(username)/\(repo)/issues", fixture: "issues")
        
        gitHubService.getIssues(for: username, in: repo) { result in
            defer { expectation.fulfill() }
            guard case let .success(issues) = result else {
                XCTFail("Unexpected Failure")
                return
            }
            
            XCTAssertEqual(issues.count, 1)
            XCTAssertEqual(issues.first?.title, "Found a bug")
            XCTAssertEqual(issues.first?.body, "I'm having a problem with this.")
        }
        
        wait(for: [expectation], timeout: 5)
    }
}
