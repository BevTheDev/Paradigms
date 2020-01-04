//
//  NetworkMocker.swift
//  ParadigmsTests
//
//  Created by Beverly Massengill on 1/4/20.
//  Copyright © 2020 BevTheDev. All rights reserved.
//

import OHHTTPStubs

class NetworkMocker {
    
    // MARK: - Add/Remove All Stubs
    
    static func stubAllRequestsWithFailure() {
        
        let stubAllBlock: OHHTTPStubsTestBlock = { _ -> Bool in
            return true
        }
        
        let standardResponseBlock: OHHTTPStubsResponseBlock = { _ -> OHHTTPStubsResponse in
             return OHHTTPStubsResponse(jsonObject: ["stub": "This request has been stubbed"], statusCode: 500, headers: nil)
        }
        
        OHHTTPStubs.stubRequests(passingTest: stubAllBlock, withStubResponse: standardResponseBlock)
    }
    
    static func removeAllStubs() {
        
        OHHTTPStubs.removeAllStubs()
    }
    
    // MARK: - Default Stubs
    
    static func addDefaultStubs() {
        
        stubAllRequestsWithFailure()
        
        stubPostsRequest()
    }
    
    // MARK: - Stubs
    
    static func stub(
        forPath path: String,
        httpMethod: HTTPMethod = .get,
        responseFileName: String,
        responseStatus: Int = 200,
        responseTime: TimeInterval = 0
        ) {
        
        let stubSignature = RequestSignature(path: path, method: httpMethod)
        
        let testBlock = compareRequestSignatures(stubSignature)
        
        let responseStub: OHHTTPStubsResponseBlock = { _ in
            
            let response = OHHTTPStubsResponse(
                fileAtPath: attemptToGetFilePath(withFilename: responseFileName),
                statusCode: Int32(responseStatus),
                headers: [:]
            )
            
            response.responseTime = responseTime
            return response
        }
        
        OHHTTPStubs.stubRequests(passingTest: testBlock, withStubResponse: responseStub)
    }
    
    // MARK: - Helpers
    
    static private func attemptToGetFilePath(withFilename filename: String) -> String {
        
        guard let filePath = OHPathForFileInBundle(filename, Bundle(for: self)) else {
            fatalError("File with filename not found: \(filename)")
        }
        
        return filePath
    }
    
    static private func compareRequestSignatures(_ stubSignature: RequestSignature) -> OHHTTPStubsTestBlock {
        
        return { request in
            
            let requestSignature = RequestSignature(request: request)
            
            return requestSignature == stubSignature
        }
    }
}
