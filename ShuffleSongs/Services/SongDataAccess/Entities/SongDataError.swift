//
//  SongDataError.swift
//  ShuffleSongs
//
//  Created by Paulo Henrique dos Santos on 09/09/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import Foundation

enum SongDataError: Error {
    case invaliSongData
    case noData
    case errorFetchingData
}

extension SongDataError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invaliSongData:
            return NSLocalizedString("An error was found while getting the data.", comment: "Invalid Song Data")
        case .noData:
            return NSLocalizedString("The server has returned no data.", comment: "No Data")
        case .errorFetchingData:
            return NSLocalizedString("Fail to connect to server.", comment: "Server Error")
        }
    }
}
