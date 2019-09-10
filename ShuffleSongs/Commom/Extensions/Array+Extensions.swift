//
//  Array+Extensions.swift
//  ShuffleSongs
//
//  Created by Paulo Henrique dos Santos on 09/09/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {
    mutating func remove(object: Element) {
        if let index = firstIndex(of: object) {
            remove(at: index)
        }
    }
}
