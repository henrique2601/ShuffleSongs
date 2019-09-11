//
//  MockSongDataAccess.swift
//  ShuffleSongs
//
//  Created by Paulo Henrique dos Santos on 10/09/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import Foundation
@testable import ShuffleSongs

class MockSongDataAccess: SongDataAccessProtocol {
    var songsToReturn: [SongEntity] = []
    var errorToReturn: SongDataError!
    
    var shouldReturnError = false
    
    func fetchSong(from artists: [Int], completionHandler: @escaping (Result<[SongEntity], SongDataError>) -> Void) {
        if shouldReturnError {
            completionHandler(.failure(errorToReturn))
        } else {
            completionHandler(.success(songsToReturn))
        }
    }
}
