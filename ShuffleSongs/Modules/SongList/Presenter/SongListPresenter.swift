//
//  SongListPresenter.swift
//  ShuffleSongs
//
//  Created by Paulo Henrique dos Santos on 05/09/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

class SongListPresenter: SongListPresenterProtocol {
    var view: SongListViewProtocol?
    var interactor: SongListInteractorProtocol?
    var router: SongListRouterProtocol?
    
    func viewWillAppear() {
        view?.startLoadingAnimation()
        interactor?.fetchSongs()
    }
    
    func shuffleDidTap() {
        interactor?.shuffleSongs()
    }
}

extension SongListPresenter: SongListInteractorOutputProtocol {
    func songsDidFetch(songs: [SongEntity]) {
        updateViewWith(songs: songs)
    }
    
    func songListFailToFetch(errorMessage: String) {
        view?.stopLoadingAnimation()
        view?.showAlert(message: errorMessage)
    }
    
    func songsShuffled(songs: [SongEntity]) {
        updateViewWith(songs: songs)
    }
    
    private func updateViewWith(songs: [SongEntity]) {
        let viewModel = songs.map { SongViewModel(entity: $0) }
        view?.stopLoadingAnimation()
        view?.updateWith(songList: viewModel)
    }
}
