//
//  MarvelFunUITests.swift
//  MarvelFunUITests
//
//  Created by Cody on 4/22/24.
//

import XCTest

final class MarvelFunUITests: XCTestCase {
    
    private var app: XCUIApplication!

    override func setUpWithError() throws {
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testComicTitle() throws {
        app = XCUIApplication()
        app.launchArguments = ["-uitestingmock"]
        app.launch()
        
        sleep(1)
        // UI tests must launch the application that they test.
        let comicButton = app.buttons["Ant-Man (2003) #1"]
        XCTAssert(comicButton.exists)
        comicButton.tap()
        
        let comicTitle = app.staticTexts["MainComicTitle"]
        XCTAssert(comicTitle.exists)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
