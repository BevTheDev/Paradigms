//
//  WebService.swift
//  Paradigms
//
//  Created by Beverly Massengill on 12/17/19.
//  Copyright © 2019 BevTheDev. All rights reserved.
//

import Alamofire

enum WebResponse<T> {
    case success(T)
    case failure(String)
}

class WebService {

    static func sendRequest(urlString: String, method: HTTPMethod, completion: @escaping (WebResponse<Data>) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completion(.failure("Bad URL"))
            return
        }
        
        SessionManager.default.request(url, method: method).validate().responseData { response in
            
            switch (response.data, response.error) {
            case (let data?, _):
                completion(.success(data))
                
            case (_, let error?):
                completion(.failure(error.localizedDescription))
                
            default:
                completion(.failure("An unknown error occured."))
            }
        }
    }
}
