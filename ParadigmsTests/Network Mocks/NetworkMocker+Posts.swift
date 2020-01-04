//
//  NetworkMocker+Posts.swift
//  ParadigmsTests
//
//  Created by Beverly Massengill on 1/4/20.
//  Copyright © 2020 BevTheDev. All rights reserved.
//

import OHHTTPStubs

extension NetworkMocker {
    
    static func stubPostsRequest() {
        
        stub(forPath: "/posts", responseFileName: "posts_response.json")
    }
}
