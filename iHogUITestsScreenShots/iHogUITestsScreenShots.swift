//
//  iHogUITestsScreenShots.swift
//  iHogUITestsScreenShots
//
//  Created by Maegan Wilson on 2/1/21.
//

import XCTest

class iHogUITestsScreenShots: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        setupSnapshot(app)

        // Use recording to get started writing UI tests.
        
        let tablesQuery2 = app.tables
        let oscIsOffSwitch = tablesQuery2/*@START_MENU_TOKEN@*/.switches["OSC is off"]/*[[".cells[\"OSC is off\"].switches[\"OSC is off\"]",".switches[\"OSC is off\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        oscIsOffSwitch.tap()
        oscIsOffSwitch.tap()
        app.navigationBars["Device Settings"].buttons["Back"].tap()
        snapshot("device")
        let tablesQuery = tablesQuery2
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Programming"]/*[[".cells[\"Programming\"].buttons[\"Programming\"]",".buttons[\"Programming\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        snapshot("programming")
        app.navigationBars["Command line text"].buttons["Back"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Playback"]/*[[".cells[\"Playback\"].buttons[\"Playback\"]",".buttons[\"Playback\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["_TtGC7SwiftUIP13$7fff57adc30428DestinationHosting"].buttons["Back"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Add Show"]/*[[".cells[\"Add Show\"].buttons[\"Add Show\"]",".buttons[\"Add Show\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.textFields["Show Name"].tap()
        
                // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
