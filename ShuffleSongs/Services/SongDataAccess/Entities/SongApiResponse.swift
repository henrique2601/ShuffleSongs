//
//  SongApiResponse.swift
//  ShuffleSongs
//
//  Created by Paulo Henrique dos Santos on 08/09/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import Foundation

struct SongApiResponse: Codable {
    var results: SongsWrapper
    var resultCount: Int
}
