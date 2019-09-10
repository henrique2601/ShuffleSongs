//
//  SongEntity.swift
//  ShuffleSongs
//
//  Created by Paulo Henrique dos Santos on 08/09/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import Foundation

struct SongEntity: Codable {
    var id: Int?
    var country: String?
    var primaryGenreName: String
    var artworkUrl: String
    var releaseDate: String?
    var artistId: Int
    var trackTimeMillis: Int?
    var collectionName: String?
    var artistName: String
    var trackExplicitness: String?
    var trackCensoredName: String?
    var collectionId: Int?
    var trackName: String
    var wrapperType: String?
    
    init(primaryGenreName: String, artworkUrl: String, artistName: String, trackName: String, artistId: Int) {
        self.primaryGenreName = primaryGenreName
        self.artworkUrl = artworkUrl
        self.artistName = artistName
        self.trackName = trackName
        self.artistId = artistId
    }
}

extension SongEntity: Equatable {
    static func == (lhs: SongEntity, rhs: SongEntity) -> Bool {
        return lhs.trackName == rhs.trackName &&
               lhs.artistId == rhs.artistId
    }
}
