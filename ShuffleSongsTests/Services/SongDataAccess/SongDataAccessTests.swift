//
//  SongDataAccessTests.swift
//  ShuffleSongsTests
//
//  Created by Paulo Henrique dos Santos on 10/09/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import XCTest
@testable import ShuffleSongs

class SongDataAccessTests: XCTestCase {
    var dataAccess: SongDataAccess!
    var webService: MockWebService!

    override func setUp() {
        dataAccess = SongDataAccess()
        webService = MockWebService()
        
        dataAccess.webService = webService
    }

    func testFetchSongs() {
        let artists = [909253, 1171421960, 358714030, 1419227, 264111789]
        
        dataAccess.fetchSong(from: artists) { (result) in
            switch result {
            case .success(let songList):
                XCTAssertEqual(songList.count, 25)
                break
            case .failure( _):
                XCTFail()
                break
            }
        }
        
        XCTAssertEqual(webService.getDataCalledWith, "https://us-central1-tw-exercicio-mobile.cloudfunctions.net/lookup?id=909253,1171421960,358714030,1419227,264111789&limit=5")
    }
    
    func testFetchSongsWebServiceError() {
        webService.shouldReturnError = true
        
        dataAccess.fetchSong(from: []) { (result) in
            switch result {
            case .success( _):
                XCTFail()
                break
            case .failure(let error):
                XCTAssertEqual(error, .errorFetchingData)
                break
            }
        }
    }
    
    func testFetchSongsNoDataError() {
        webService.jsonName = "SongsNoData"
        
        dataAccess.fetchSong(from: []) { (result) in
            switch result {
            case .success( _):
                XCTFail()
                break
            case .failure(let error):
                XCTAssertEqual(error, .noData)
                break
            }
        }
    }
    
    func testFetchSongsInvalidDataError() {
        webService.jsonName = "SongInvalidData"
        
        dataAccess.fetchSong(from: []) { (result) in
            switch result {
            case .success( _):
                XCTFail()
                break
            case .failure(let error):
                XCTAssertEqual(error, .invaliSongData)
                break
            }
        }
    }

}

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
