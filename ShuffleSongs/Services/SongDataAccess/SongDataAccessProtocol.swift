//
//  SongDataAccessProtocol.swift
//  ShuffleSongs
//
//  Created by Paulo Henrique dos Santos on 08/09/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import Foundation

protocol SongDataAccessProtocol {
    func fetchSong(from artists: [Int], completionHandler: @escaping (Result<[SongEntity], SongDataError>) -> Void)
}
