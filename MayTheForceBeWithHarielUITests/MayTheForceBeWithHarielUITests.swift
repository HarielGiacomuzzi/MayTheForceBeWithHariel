//
//  MayTheForceBeWithHarielUITests.swift
//  MayTheForceBeWithHarielUITests
//
//  Created by Hariel Giacomuzzi on 10/07/19.
//  Copyright © 2019 Giacomuzzi. All rights reserved.
//

import XCTest

class MayTheForceBeWithHarielUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false

        XCUIApplication().launch()
    }

    func testRenderTableView() {
        let app = XCUIApplication()

        app.otherElements.containing(.navigationBar, identifier:"Details").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
        app.buttons["Favorite"].tap()
        app.alerts["Favorite R2-D2"].buttons["Ok"].tap()
        app.navigationBars["Details"].buttons["Back"].tap()
    }

}
