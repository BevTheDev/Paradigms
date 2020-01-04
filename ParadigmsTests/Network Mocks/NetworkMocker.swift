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
        
        OHHTTPStubs.stubRequests(passingTest: stubAllTestBlock(), withStubResponse: standardStubResponse())
    }
    
    static func removeAllStubs() {
        
        OHHTTPStubs.removeAllStubs()
    }
    
    // MARK: - Default Stubs
    
    static func addDefaultStubs() {
        
        stubAllRequestsWithFailure()
        
        
    }
    
    // MARK: - Stubs
    
    static func stubAllTestBlock() -> OHHTTPStubsTestBlock {
        
        let testBlock: OHHTTPStubsTestBlock = { _ -> Bool in
            return true
        }
        
        return testBlock
    }
    
    static func standardStubResponse() -> OHHTTPStubsResponseBlock {
        
        let responseBlock: OHHTTPStubsResponseBlock = { _ -> OHHTTPStubsResponse in
             return OHHTTPStubsResponse(jsonObject: ["stub": "This request has been stubbed"], statusCode: 500, headers: nil)
        }
        
        return responseBlock
    }
}
