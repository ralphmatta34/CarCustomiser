//
//  CarCustomiserTests.swift
//  CarCustomiserTests
//
//  Created by Ralph Matta on 12/01/2024.
//

import XCTest

final class CarCustomiserTests: XCTestCase {

    func testNewCarGivesMeACarWithAllAttributesSet() {
        // ARRANGE
        // ACT
        let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)
        
        // ASSERT
        XCTAssertEqual(car.make, "Mazda")
        XCTAssertEqual(car.model, "MX-5")
        XCTAssertEqual(car.topSpeed, 125)
        XCTAssertEqual(car.acceleration, 7.7)
        XCTAssertEqual(car.handling, 5)
    }
    
    func testDisplayStatsMethod() {
        // ARRANGE
        // ACT
        let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)
        
        // ASSERT
        XCTAssertEqual(car.displayStats(), """
                        Make: Mazda\n
                        Model: MX-5\n
                        Top Speed: 125mph \n
                        Acceleration (0-60): 7.7s \n
                        Handling: 5
                        """)
        
    }
}
