//
//  SongWrapper.swift
//  ShuffleSongs
//
//  Created by Paulo Henrique dos Santos on 08/09/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import Foundation

private struct DummyCodable: Codable {} //<-- Dummy hack

struct SongsWrapper: Codable {
    var songs: [SongEntity]
    
    init(from decoder: Decoder) throws {
        var songs = [SongEntity]()
        var container = try decoder.unkeyedContainer()
        while !container.isAtEnd {
            
            if let route = try? container.decode(SongEntity.self) {
                songs.append(route)
            }
            else {
                _ = try? container.decode(DummyCodable.self) // <-- TRICK
            }
        }
        self.songs = songs
    }
}
