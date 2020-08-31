//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

@testable import Tidings
import XCTest

class CollectionExtensionsTests: XCTestCase {
	func testValidRange() {
		let array = [1, 2, 3, 4]
		let element = array[safe: 3]
		XCTAssertNotNil(element)
		XCTAssertEqual(element, 4)
	}

	func testInvalidRange() {
		let array = [1, 2, 3, 4]
		XCTAssertNil(array[safe: -1])
		XCTAssertNil(array[safe: 5])
	}
}
