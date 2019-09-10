//
//  WebService.swift
//  ShuffleSongs
//
//  Created by Paulo Henrique dos Santos on 08/09/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

protocol WebServiceProtocol {
    func getData(urlString: String, completion complete: @escaping (Result<Data, WebServiceError>) -> Void)
}

enum WebServiceError: Error {
    case invalidUrl
    case noData
    case networkError(Error)
}

class WebService: WebServiceProtocol {
    func getData(urlString: String, completion complete: @escaping (Result<Data, WebServiceError>) -> Void) {
        guard let url = URL(string: urlString) else {
                complete(.failure(.invalidUrl))
                return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let safeError = error {
                complete(.failure(.networkError(safeError)))
                return
            }
            guard let data = data else {
                complete(.failure(.noData))
                return
            }
            
            complete(.success(data))
            }.resume()
    }
}
