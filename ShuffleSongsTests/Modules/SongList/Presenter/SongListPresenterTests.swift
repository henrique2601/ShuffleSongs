//
//  SongListPresenterTests.swift
//  ShuffleSongsTests
//
//  Created by Paulo Henrique dos Santos on 10/09/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import Foundation

import XCTest
@testable import ShuffleSongs

class SongListPresenterTests: XCTestCase {
    var presenter: SongListPresenter!
    var view: MockSongListView!
    var interactor: MockSongListInteractor!
    
    override func setUp() {
        presenter = SongListPresenter()
        view = MockSongListView()
        interactor = MockSongListInteractor()
        
        presenter.view = view
        presenter.interactor = interactor
    }
    
    func testViewWillAppear() {
        presenter.viewWillAppear()
        
        XCTAssertTrue(interactor.fetchSongsCalled)
        XCTAssertTrue(view.startLoadingAnimationCalled)
    }
    
    func testShuffleDidTap() {
        presenter.shuffleDidTap()
        
        XCTAssertTrue(interactor.shuffleSongsCalled)
    }
    
    func testSongsDidFetch() {
        let songs = generateSongEntities()
        let expectedViewModel = generateSongViewModels()
        presenter.songsDidFetch(songs: songs)
        
        XCTAssertTrue(view.stopLoadingAnimationCalled)
        XCTAssertEqual(view.updateWithCalledWith, expectedViewModel)
    }
    
    func testSongsFailToFetch() {
        presenter.songsFailToFetch(errorMessage: "Error Message")
        
        XCTAssertTrue(view.stopLoadingAnimationCalled)
        XCTAssertEqual(view.updateWithCalledWith, [])
        XCTAssertEqual(view.showAlertCalledWith, "Error Message")
    }
    
    func testSongsShuffled() {
        let songs = generateSongEntities()
        let expectedViewModel = generateSongViewModels()
        presenter.songsDidFetch(songs: songs)
        
        XCTAssertTrue(view.stopLoadingAnimationCalled)
        XCTAssertEqual(view.updateWithCalledWith, expectedViewModel)
    }
    
    private func generateSongEntities() -> [SongEntity] {
        var songs: [SongEntity] = []
        
        for i in 0..<5 {
            for j in 0..<5 {
                let song = SongEntity(primaryGenreName: "Genre",
                                      artworkUrl: "artURL",
                                      artistName: "Artist \(i)",
                                      trackName: "Track \(j)",
                                      artistId: i)
                songs.append(song)
            }
        }
        
        return songs
    }
    
    private func generateSongViewModels() -> [SongViewModel] {
        var songs: [SongViewModel] = []
        
        for i in 0..<5 {
            for j in 0..<5 {
                var songViewModel = SongViewModel()
                songViewModel.imageURL = "artURL"
                songViewModel.title = "Track \(j)"
                songViewModel.subTitle = "Artist \(i) (Genre)"
                
                songs.append(songViewModel)
            }
        }
        
        return songs
    }
}
