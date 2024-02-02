//
//  CarCustomiserUITests.swift
//  CarCustomiserUITests
//
//  Created by Ralph Matta on 12/01/2024.
//

import XCTest

final class CarCustomiserUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWhenBoughtTiresExhaustPackageDisables() throws {
        // ARRANGE
        let app = XCUIApplication()
        app.launch()

        // ACT
        app.collectionViews/*@START_MENU_TOKEN@*/.switches["Tires Package (500)"]/*[[".cells.switches[\"Tires Package (500)\"]",".switches[\"Tires Package (500)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        // ASSERT
        XCTAssertEqual(app.collectionViews.switches["Tires Package (500)"].isEnabled, true)
        XCTAssertEqual(app.collectionViews.switches["Exhaust Package (500)"].isEnabled, false)
                       
    }
    
    func testRemainingFundsGoTo250WhenExhaustPackageToggled() throws {
        // ARRANGE
        let app = XCUIApplication()
        app.launch()
        
        // ACT
        // Recording didn't work
        
        // ASSERT
        // XCTAssertEqual(...)
    }
    
    func testButtonPressCarDataChanges() throws {
        // ARRANGE
        let app = XCUIApplication()
        app.laucnh()
        
        // ACT
        // Recording didn't work
        
        // ASSERT
        // XCTAssertEqual(...)
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
