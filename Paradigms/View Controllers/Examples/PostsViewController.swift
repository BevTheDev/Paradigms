//
//  PostsViewController.swift
//  Paradigms
//
//  Created by Beverly Massengill on 12/17/19.
//  Copyright © 2019 BevTheDev. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var posts: [Post] = [] {
        didSet {
            tableView.reloadData()
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

    // MARK: - Tableview Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let reuseIdentifier = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) ?? UITableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
        
        cell.textLabel?.text = posts[indexPath.row].title
        
        return cell
    }
}
