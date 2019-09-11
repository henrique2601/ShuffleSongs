//
//  Robot.swift
//  ShuffleSongsUITests
//
//  Created by Paulo Henrique dos Santos on 10/09/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import XCTest

class Robot {
    var app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    @discardableResult
    func tap(element: XCUIElement) -> Self {
        element.tap()
        
        return self
    }
    
    @discardableResult
    func count(query: XCUIElementQuery, value: Int) -> Self {
        XCTAssertEqual(query.count, value)
        
        return self
    }
}
