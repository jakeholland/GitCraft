//
//  RepositoriesViewModelTests.swift
//  GitCraftTests
//
//  Created by Jacob Holland on 3/20/20.
//  Copyright © 2020 Jacob Holland. All rights reserved.
//

import XCTest
@testable import GitCraft

final class RepositoriesViewModelTests: XCTestCase {
    
    private lazy var mockGitHubService = MockGitHubService()
    private lazy var username = "test"
    private lazy var viewModel = RepositoriesViewModel(username: username,
                                                       gitHubService: mockGitHubService)
    private lazy var mockRepositories: [MockRepository] = [
        .init(name: "Number 1", description: "1"),
        .init(name: "Number 2", description: "2")
    ]
    
    func testGetRepositories() {
        let expectation = XCTestExpectation(description: "Get respositories")
        mockGitHubService.repositoriesToReturn = mockRepositories
        
        viewModel.getRepositories(success: {
            XCTAssertEqual(self.viewModel.numberOfRespositories, 2)
            XCTAssertEqual(self.viewModel.repository(at: 0)?.name, self.mockRepositories[0].name)
            expectation.fulfill()
        }, failure: { _ in
            XCTFail("Unexpected Failure")
        })
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testGetRepositoriesFails() {
        let expectation = XCTestExpectation(description: "Get respositories")
        let mockError = MockError()
        mockGitHubService.repositoriesErrorToReturn = mockError
        
        viewModel.getRepositories(success: {
            XCTFail("Unexpected Success")
        }, failure: { error in
            XCTAssertEqual(error as? MockError, mockError)
            XCTAssertEqual(self.viewModel.numberOfRespositories, 0)
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 5)
    }
}
