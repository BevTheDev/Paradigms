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
    
    var testVC: MockPostsVC!
    
    override func setUp() {
        
        super.setUp()
        
        testVC = MockPostsVC()
//        testVC.loadView()
    }

    func testJsonParsing() {
        
        let updateExpectation = expectation(description: "Posts should be loaded")
        testVC.postsUpdatedExpectation = updateExpectation
        
        testVC.viewDidLoad()
        
        wait(for: [updateExpectation], timeout: 1)
        
        XCTAssertEqual(testVC.posts.count, 3)
    }
    
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
