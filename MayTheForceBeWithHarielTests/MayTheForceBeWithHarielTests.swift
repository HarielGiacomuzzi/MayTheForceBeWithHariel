//
//  MayTheForceBeWithHarielTests.swift
//  MayTheForceBeWithHarielTests
//
//  Created by Hariel Giacomuzzi on 10/07/19.
//  Copyright © 2019 Giacomuzzi. All rights reserved.
//

import XCTest
@testable import MayTheForceBeWithHariel

class MayTheForceBeWithHarielTests: XCTestCase {
    private var personService: PeopleServiceProtocol!

    override func setUp() {
        self.personService = PeopleService()
    }

    override func tearDown() {
        self.personService = nil
    }

    func testExample() {
        self.personService.getPeople(page: 0) { (people) in
            XCTAssertTrue(people.count != 0)
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
