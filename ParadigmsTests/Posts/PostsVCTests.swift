//
//  PostsVCTests.swift
//  ParadigmsTests
//
//  Created by Beverly Massengill on 1/4/20.
//  Copyright © 2020 BevTheDev. All rights reserved.
//

import XCTest

@testable import Paradigms

class PostsVCTests: BaseTestCase {

    func testPostParsing() {
        
        let mockVC = MockPostsVC()
        
        let updateExpectation = expectation(description: "Posts should be loaded")
        mockVC.postsUpdatedExpectation = updateExpectation
        
        mockVC.loadPosts()
        
        wait(for: [updateExpectation], timeout: 1)
        
        XCTAssertEqual(mockVC.posts.count, 3)
        XCTAssertEqual(mockVC.posts.first?.title, "title from file")
        XCTAssertEqual(mockVC.posts.first?.body, "body from file")
        XCTAssertEqual(mockVC.posts.first?.userId, 1)
    }
    
    func testDataLoadRefreshesTable() {
        
        let testVC = PostsViewController()
        testVC.loadView()
        XCTAssertEqual(testVC.tableView(testVC.tableView, numberOfRowsInSection: 0), 0)
        
        testVC.posts = [Post(title: "test", userId: 1, body: "test body")]
        
        XCTAssertEqual(testVC.tableView(testVC.tableView, numberOfRowsInSection: 0), 1)
        let cell = testVC.tableView(testVC.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(cell.textLabel?.text, "test")
    }
    
    // MARK: - Mock Objects
    
    class MockPostsVC: PostsViewController {
        
        var postsUpdatedExpectation: XCTestExpectation?
        
        var mockPosts: [Post] = []
        
        override var posts: [Post] {
            get {
                return mockPosts
            }
            set {
                mockPosts = newValue
                postsUpdatedExpectation?.fulfill()
            }
        }
    }
}
