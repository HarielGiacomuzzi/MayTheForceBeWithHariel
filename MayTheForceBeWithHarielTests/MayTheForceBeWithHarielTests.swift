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

    func testServiceFetchPersons() {
        let expectation = XCTestExpectation(description: "Need to wait fetch data from server")
        expectation.expectedFulfillmentCount = 1

        self.personService.getPeople(page: 0) { (people) in
            XCTAssertNotNil(people)
            XCTAssertTrue(people.count == 10)
            XCTAssertTrue(people.first?.name == "Luke Skywalker")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 60.0)
    }

    func testServiceFavoritePerson() {
        let expectation = XCTestExpectation(description: "Need to wait fetch data from server and post it back")
        expectation.expectedFulfillmentCount = 2

        self.personService.getPeople(page: 0) { (people) in
            XCTAssertNotNil(people)
            XCTAssertTrue(people.count == 10)
            XCTAssertTrue(people.first?.name == "Luke Skywalker")
            expectation.fulfill()

            self.personService.favoritePerson(person: people.first!, completion: { (success) in
                XCTAssertTrue(success)
                expectation.fulfill()
            })
        }

        wait(for: [expectation], timeout: 60.0)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
