//
//  ShuffleSongsUITests.swift
//  ShuffleSongsUITests
//
//  Created by Paulo Henrique dos Santos on 05/09/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import XCTest

class SongListUITests: XCTestCase {
    
    private lazy var app = XCUIApplication()

    override func setUp() {
        app.launchArguments.append("UITesting")
        app.launch()
    }

    func testSongListSmoke() {
        SongListRobot(app: app)
            .checkCellsAreFromTheSameArtist()
            .verifyCellsCountEqual(value: 25)
            .tapOnShuffleButton()
            .checkCellsWasShuffled()
    }

}
