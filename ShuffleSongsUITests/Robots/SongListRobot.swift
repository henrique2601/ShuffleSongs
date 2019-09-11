//
//  SongListRobot.swift
//  ShuffleSongsUITests
//
//  Created by Paulo Henrique dos Santos on 10/09/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import XCTest

class SongListRobot: Robot {
    private lazy var shuffleButton = app.navigationBars["Song List Navigation Bar"].buttons["shuffle"]
    
    @discardableResult
    func verifyCellsCountEqual(value: Int) -> Self {
        return count(query: app.tables.cells, value: value)
    }
    
    @discardableResult
    func checkCellsAreFromTheSameArtist() -> Self {
        for index in 0..<4 {
            let cellSubtitle = app.tables.cells["Song Cell \(index)"].staticTexts["Subtitle"].label
            let nextCellSubtitle = app.tables.cells["Song Cell \(index + 1)"].staticTexts["Subtitle"].label
            XCTAssertEqual(cellSubtitle, nextCellSubtitle)
        }
        
        return self
    }
    
    @discardableResult
    func tapOnShuffleButton() -> Self {
        return tap(element: shuffleButton)
    }
    
    @discardableResult
    func checkCellsWasShuffled() -> Self {
        for index in 0..<4 {
            let cellSubtitle = app.tables.cells["Song Cell \(index)"].staticTexts["Subtitle"].label
            let nextCellSubtitle = app.tables.cells["Song Cell \(index + 1)"].staticTexts["Subtitle"].label
            XCTAssertNotEqual(cellSubtitle, nextCellSubtitle)
        }
        
        return self
    }
}
