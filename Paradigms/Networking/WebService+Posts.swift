//
//  WebService+Posts.swift
//  Paradigms
//
//  Created by Beverly Massengill on 12/17/19.
//  Copyright © 2019 BevTheDev. All rights reserved.
//

import Foundation

extension WebService {
    
    static func getPosts(completion: @escaping (WebResponse<[Post]>) -> Void) {
        
        let url = Constants.Networking.samplePosts
        
        WebService.sendRequest(urlString: url, method: .get) { response in
            
            switch response {
            case .success(let data):
                do {
                    let posts = try JSONDecoder().decode([Post].self, from: data)
                    completion(.success(posts))
                }
                catch {
                    completion(.failure("Parse error"))
                }
                
            case .failure(let errorMessage):
                completion(.failure(errorMessage))
            }
        }
    }
}
