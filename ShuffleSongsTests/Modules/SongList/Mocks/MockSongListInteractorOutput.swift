//
//  MockSongListInteractorOutput.swift
//  ShuffleSongsTests
//
//  Created by Paulo Henrique dos Santos on 10/09/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import Foundation
@testable import ShuffleSongs

class MockSongListInteractorOutput: SongListInteractorOutputProtocol {
    var view: SongListViewProtocol?
    
    var songsDidFetchCalled = false
    var songsDidFetchCalledWith: [SongEntity] = []
    
    var songsFailToFetchCalled = false
    var songsFailToFetchCalledWith = ""
    
    var songsShuffledCalled = false
    var songsShuffledCalledWith: [SongEntity] = []
    
    func songsDidFetch(songs: [SongEntity]) {
        songsDidFetchCalled = true
        songsDidFetchCalledWith = songs
    }
    
    func songsFailToFetch(errorMessage: String) {
        songsFailToFetchCalled = true
        songsFailToFetchCalledWith = errorMessage
    }
    
    func songsShuffled(songs: [SongEntity]) {
        songsShuffledCalled = true
        songsShuffledCalledWith = songs
    }
}
