//
//  RequestSignature.swift
//  ParadigmsTests
//
//  Created by Beverly Massengill on 1/4/20.
//  Copyright © 2020 BevTheDev. All rights reserved.
//

import Foundation

// MARK: - HTTPMethod

enum HTTPMethod: String {
    
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
}

// MARK: - Request/Response Signatures

struct RequestSignature: Equatable {

    let path: String
    let method: HTTPMethod
    
    init(path: String, method: HTTPMethod) {
        
        self.path = path
        self.method = method
    }
    
    init(request: URLRequest) {
        
        let path = request.url?.path ?? ""
        let method = HTTPMethod(rawValue: request.httpMethod ?? "") ?? .get
        
        self.init(path: path, method: method)
    }
    
    static func == (lhs: RequestSignature, rhs: RequestSignature) -> Bool {
        
        return lhs.path == rhs.path && lhs.method == rhs.method
    }
}
