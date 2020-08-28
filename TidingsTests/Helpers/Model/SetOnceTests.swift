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
		XCTAssert(onceNullable == updated)
		onceNullable = UUID().uuidString
		XCTAssert(onceNullable == updated)
		onceNullable = nil
		XCTAssert(onceNullable == nil)
	}

	func testSetOnceNotNullable() {
		onceNotNullable = nil
		XCTAssertNil(onceNotNullable)
		let updated = UUID().uuidString
		onceNotNullable = updated
		XCTAssert(onceNotNullable == updated)
		onceNotNullable = UUID().uuidString
		XCTAssert(onceNotNullable == updated)
		onceNotNullable = nil
		XCTAssert(onceNotNullable == updated)
	}
}

