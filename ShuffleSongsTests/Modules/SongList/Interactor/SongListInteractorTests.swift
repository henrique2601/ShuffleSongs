//
//  SongListInteractorTests.swift
//  ShuffleSongsTests
//
//  Created by Paulo Henrique dos Santos on 09/09/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import XCTest
@testable import ShuffleSongs

class SongListInteractorTests: XCTestCase {
    var interactor: SongListInteractor!
    var output: MockSongListInteractorOutput!
    var dataAccess: MockSongDataAccess!
    
    override func setUp() {
        interactor = SongListInteractor()
        output = MockSongListInteractorOutput()
        dataAccess = MockSongDataAccess()
        
        interactor.output = output
        SongDataAccessFactory.shared = dataAccess
    }

    func testSongsFetchSuccess() {
        dataAccess.songsToReturn = generateSongsData()
        let expectedSongsData = generateSongsData()
        let expectedSongsCount = 25
        
        interactor.fetchSongs()
        
        XCTAssertTrue(output.songsDidFetchCalled)
        XCTAssertEqual(output.songsDidFetchCalledWith, expectedSongsData)
        XCTAssertEqual(output.songsDidFetchCalledWith.count, expectedSongsCount)
    }
    
    func testSongsFetchFail() {
        dataAccess.errorToReturn = .errorFetchingData
        dataAccess.shouldReturnError = true
        let expectedErrorMessage = "Fail to connect to server."
        
        interactor.fetchSongs()
        
        XCTAssertFalse(output.songsDidFetchCalled)
        XCTAssertTrue(output.songsFailToFetchCalled)
        XCTAssertEqual(output.songsFailToFetchCalledWith, expectedErrorMessage)
    }
    
    func testSongsShuffle() {
        interactor.songs = generateSongsData()
        
        for i in 0..<4 {
            XCTAssertEqual(interactor.songs[i].artistId, interactor.songs[i + 1].artistId)
        }
        
        interactor.shuffleSongs()
        for i in 0..<interactor.songs.count - 1 {
            XCTAssertNotEqual(interactor.songs[i].artistId, interactor.songs[i + 1].artistId)
        }
    }
    
    private func generateSongsData() -> [SongEntity] {
        var songs: [SongEntity] = []
        
        for i in 0..<5 {
            for j in 0..<5 {
                let song = SongEntity(primaryGenreName: "Genre Name",
                                      artworkUrl: "",
                                      artistName: "Artist \(i)",
                    trackName: "Track \(j)",
                    artistId: i)
                songs.append(song)
            }
        }
        
        return songs
    }
}
