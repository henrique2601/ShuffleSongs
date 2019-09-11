//
//  MockSongListView.swift
//  ShuffleSongsTests
//
//  Created by Paulo Henrique dos Santos on 10/09/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import Foundation
@testable import ShuffleSongs

class MockSongListView: SongListViewProtocol {
    var presenter: SongListPresenterProtocol?
    var startLoadingAnimationCalled = false
    var stopLoadingAnimationCalled = false
    var updateWithCalledWith: [SongViewModel] = []
    var showAlertCalledWith = ""
    
    func startLoadingAnimation() {
        startLoadingAnimationCalled = true
    }
    
    func stopLoadingAnimation() {
        stopLoadingAnimationCalled = true
    }
    
    func updateWith(songList: [SongViewModel]) {
        updateWithCalledWith = songList
    }
    
    func showAlert(message: String) {
        showAlertCalledWith = message
    }
}
