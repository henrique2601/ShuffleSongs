//
//  SongListInteractor.swift
//  ShuffleSongs
//
//  Created by Paulo Henrique dos Santos on 05/09/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

class SongListInteractor: SongListInteractorProtocol {
    var output: SongListInteractorOutputProtocol?
    var songs: [SongEntity] = []
    
    func fetchSongs() {
        songs = []
        
        let artists = [909253, 1171421960, 358714030, 1419227, 264111789]
        
        SongDataAccessFactory.shared.fetchSong(from: artists) { [weak self] (result) in
            switch result {
            case .success(let songs):
                self?.songs = songs
                self?.output?.songsDidFetch(songs: songs)
                break
            case .failure(let error):
                self?.output?.songsFailToFetch(errorMessage: error.localizedDescription)
                break
            }
        }
    }
    
    func shuffleSongs() {
        shuffleSongList()
        output?.songsShuffled(songs: songs)
    }
    
    private func shuffleSongList() {
        var shuffledSongs: [SongEntity] = []
        var songsByArtist = Dictionary(grouping: songs, by: { $0.artistId })
        
        let maxCount = songsByArtist.map { $0.value.count }.max { $0 > $1 } ?? 0
        
        for _ in 0..<maxCount {
            songsByArtist.forEach { (item) in
                if let element = item.value.randomElement() {
                    shuffledSongs.append(element)
                    songsByArtist[item.key]?.remove(object: element)
                }
            }
        }
        
        songs = shuffledSongs
    }
}
