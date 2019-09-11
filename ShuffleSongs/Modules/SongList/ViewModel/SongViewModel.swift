//
//  SongViewModel.swift
//  ShuffleSongs
//
//  Created by Paulo Henrique dos Santos on 08/09/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import Foundation

struct SongViewModel: Equatable {
    var imageURL: String
    var title: String
    var subTitle: String
    
    init(entity: SongEntity) {
        imageURL = entity.artworkUrl
        title = entity.trackName
        subTitle = "\(entity.artistName) (\(entity.primaryGenreName))"
    }
    
    init() {
        imageURL = ""
        title = ""
        subTitle = ""
    }
}
