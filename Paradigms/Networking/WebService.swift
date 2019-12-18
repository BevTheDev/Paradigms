//
//  WebService.swift
//  Paradigms
//
//  Created by Beverly Massengill on 12/17/19.
//  Copyright © 2019 BevTheDev. All rights reserved.
//

import Alamofire

public typealias JSON = [String: Any]

enum WebResponse {
    case success(JSON?)
    case failure(String)
}

class WebService {
    
    static func sendRequest(urlString: String, method: HTTPMethod, completion: @escaping (WebResponse) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completion(.failure("Bad URL"))
            return
        }
        
        SessionManager.default.request(url, method: method).validate().responseData { response in
            
            switch (response.data, response.error) {
            case (let data?, _):
                if let json = convertToJSON(data) {
                    completion(.success(json))
                }
                else {
                    completion(.failure("Nil response"))
                }
                
            case (_, let error?):
                completion(.failure(error.localizedDescription))
                
            default:
                completion(.failure("An unknown error occured."))
            }
        }
    }
    
    // MARK: - Helpers
    
    static func convertToJSON(_ data: Data) -> JSON? {
        
        var jsonResult: JSON?
        
        do {
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? JSON {
                jsonResult = json
            }
        }
        catch {
            // TODO: log an error
        }
        
        return jsonResult
    }
}
