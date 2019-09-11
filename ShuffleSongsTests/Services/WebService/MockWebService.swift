//
//  MockWebService.swift
//  ShuffleSongsTests
//
//  Created by Paulo Henrique dos Santos on 11/09/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import XCTest
@testable import ShuffleSongs

class MockWebService: WebServiceProtocol {
    var jsonName = "Songs"
    var getDataCalledWith = ""
    var shouldReturnError = false
    var errorToReturn: WebServiceError = .invalidUrl
    
    func getData(urlString: String, completion complete: @escaping (Result<Data, WebServiceError>) -> Void) {
        if shouldReturnError {
            complete(.failure(errorToReturn))
            return
        }
        
        getDataCalledWith = urlString
        
        let bundle = Bundle(for: type(of: self))
        
        guard let url = bundle.url(forResource: jsonName, withExtension: "json") else {
            XCTFail("Missing file: \(jsonName).json")
            return
        }
        
        let json = try! Data(contentsOf: url)
        
        complete(.success(json))
    }
}
