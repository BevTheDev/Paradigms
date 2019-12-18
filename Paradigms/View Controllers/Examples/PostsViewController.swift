//
//  PostsViewController.swift
//  Paradigms
//
//  Created by Beverly Massengill on 12/17/19.
//  Copyright © 2019 BevTheDev. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController {
    
    var posts: [Post] = [] {
        didSet {
            print("\(posts)")
        }
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        loadPosts()
    }
    
    // MARK: - Data Load
    
    func loadPosts() {
        
        WebService.getPosts { response in
            
            guard case .success(let responsePosts) = response else {
                
                print("Failed to load posts")
                self.posts = []
                return
            }
            
            self.posts = responsePosts
        }
    }

}
