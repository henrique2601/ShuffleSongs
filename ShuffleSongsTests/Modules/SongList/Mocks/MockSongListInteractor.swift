//
//  MockSongListInteractor.swift
//  ShuffleSongsTests
//
//  Created by Paulo Henrique dos Santos on 10/09/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import Foundation
@testable import ShuffleSongs

class MockSongListInteractor: SongListInteractorProtocol {
    var output: SongListInteractorOutputProtocol?
    var fetchSongsCalled = false
    var shuffleSongsCalled = false
    
    func fetchSongs() {
        fetchSongsCalled = true
    }
    
    func shuffleSongs() {
        shuffleSongsCalled = true
    }
}
