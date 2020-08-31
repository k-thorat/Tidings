//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

@testable import Tidings
import XCTest

class SetOnceTests: XCTestCase {
	@SetOnce(nullable: true, wrappedValue: nil)
	var onceNullable: String?

	@SetOnce
	var onceNotNullable: String?

	func testSetOnceNullable() {
		onceNullable = nil
		XCTAssertNil(onceNullable)
		let updated = UUID().uuidString
		onceNullable = updated
		XCTAssertEqual(onceNullable, updated)
		onceNullable = UUID().uuidString
		XCTAssertEqual(onceNullable, updated)
		onceNullable = nil
		XCTAssertEqual(onceNullable, nil)
	}

	func testSetOnceNotNullable() {
		onceNotNullable = nil
		XCTAssertNil(onceNotNullable)
		let updated = UUID().uuidString
		onceNotNullable = updated
		XCTAssertEqual(onceNotNullable, updated)
		onceNotNullable = UUID().uuidString
		XCTAssertEqual(onceNotNullable, updated)
		onceNotNullable = nil
		XCTAssertEqual(onceNotNullable, updated)
	}
}

