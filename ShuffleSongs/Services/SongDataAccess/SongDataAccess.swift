//
//  SongDataAccess.swift
//  ShuffleSongs
//
//  Created by Paulo Henrique dos Santos on 08/09/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

class SongDataAccess: SongDataAccessProtocol {
    var webService: WebServiceProtocol = WebService()
    
    func fetchSong(from artists: [Int], completionHandler: @escaping (Result<[SongEntity], SongDataError>) -> Void) {
        var url = AppConstants.apiURL + artists.reduce("id=") { return "\($0)\($1)," }.dropLast()
        url += "&limit=5"
        
        webService.getData(urlString: url) { result in
            switch result {
            case .success(let data):
                do {
                    let model = try JSONDecoder().decode(SongApiResponse.self, from: data)
                    let songs = model.results.songs
                    
                    if songs.isEmpty {
                        completionHandler(.failure(.noData))
                    } else {
                        completionHandler(.success(songs))
                    }
                    return
                } catch _ {
                    completionHandler(.failure(.invaliSongData))
                    return
                }
            case .failure(_):
                completionHandler(.failure(.errorFetchingData))
                break
            }
        }
    }
}
