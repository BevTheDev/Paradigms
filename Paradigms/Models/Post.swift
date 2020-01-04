//
//  Post.swift
//  Paradigms
//
//  Created by Beverly Massengill on 12/17/19.
//  Copyright © 2019 BevTheDev. All rights reserved.
//

class Post: Decodable {
    
    let title: String
    let userId: Int
    let body: String
    
    init(title: String, userId: Int, body: String) {
        self.title = title
        self.userId = userId
        self.body = body
    }
}
