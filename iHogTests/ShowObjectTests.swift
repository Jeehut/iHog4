//
//  ShowObjectTests.swift
//  iHogTests
//
//  Created by Maegan Wilson on 6/8/21.
//

import XCTest
@testable import iHog

class ShowObjectTests: XCTestCase {
    var sut: ShowObject!

    override func setUp() {
        sut = ShowObject(objType: .group, number: 10, objColor: "red")
    }

    override func tearDown() {
        sut = nil
    }

    func disable_testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func disable_testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_showObjectName_NoNameGiven_ShouldBeGroup10() throws {
        let name = sut.getName()
        XCTAssertEqual(name, "Group 10")
    }
    
    func test_showObjectName_AfterSetName_ShouldBeWash() throws {
        sut.setName("Wash")
        XCTAssertEqual(sut.name, "Wash")
    }
}
