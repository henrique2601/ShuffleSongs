//
//  MockSongDataAccessUITest.swift
//  ShuffleSongs
//
//  Created by Paulo Henrique dos Santos on 10/09/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import Foundation

class MockSongDataAccessUITest: SongDataAccessProtocol {
    
    func fetchSong(from artists: [Int], completionHandler: @escaping (Result<[SongEntity], SongDataError>) -> Void) {
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
        
        completionHandler(.success(songs))
    }
}
