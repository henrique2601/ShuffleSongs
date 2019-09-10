//
//  SongListProtocols.swift
//  ShuffleSongs
//
//  Created by Paulo Henrique dos Santos on 05/09/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

protocol SongListViewProtocol: class {
    var presenter: SongListPresenterProtocol? { get set }
    
    // Add here your methods for communication PRESENTER -> VIEW
    func startLoadingAnimation()
    func stopLoadingAnimation()
    func updateWith(songList: [SongViewModel])
    func showAlert(message: String)
}

protocol SongListPresenterProtocol: class {
    var view: SongListViewProtocol? { get set }
    var interactor: SongListInteractorProtocol? { get set }
    var router: SongListRouterProtocol? { get set }
    
    // Add here your methods for communication VIEW -> PRESENTER
    func viewWillAppear()
    func shuffleDidTap()
    
}

protocol SongListInteractorOutputProtocol: class {
    var view: SongListViewProtocol? { get set }
    
    // Add here your methods for communication INTERACTOR -> PRESENTER
    func songsDidFetch(songs: [SongEntity])
    func songListFailToFetch(errorMessage: String)
    func songsShuffled(songs: [SongEntity])
}

protocol SongListInteractorProtocol: class {
    var output: SongListInteractorOutputProtocol? { get set }
    
    // Add here your methods for communication PRESENTER -> INTERACTOR
    func fetchSongs()
    func shuffleSongs()
}

protocol SongListRouterProtocol: class {
    // Add here your methods for communication PRESENTER -> ROUTER
    func build() -> UIViewController
}


