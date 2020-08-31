//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

@testable import Tidings
import XCTest

class PagesTests: XCTestCase {

	func testPagesSingle() {
		var pages = Pages()
		XCTAssertTrue(pages.hasMore())
		pages.receivedPage(total: 10, pageSize: 10)
		pages.receivedPage(total: 10, pageSize: 10)
		XCTAssertEqual(pages.max, 1)
		XCTAssertEqual(pages.current, 2)
		XCTAssertFalse(pages.hasMore())
		pages.receivedPage(total: 10, pageSize: 10)
		XCTAssertEqual(pages.current, 3)
	}

	func testPagesMulti() {
		var pages = Pages()
		pages.receivedPage(total: 100, pageSize: 50)
		XCTAssertTrue(pages.hasMore())
		pages.receivedPage(total: 100, pageSize: 50)
		XCTAssertFalse(pages.hasMore())
		XCTAssertEqual(pages.max, 2)
	}

	func testPagesSmall() {
		var pages = Pages()
		XCTAssertTrue(pages.hasMore())
		pages.receivedPage(total: 10, pageSize: 20)
		XCTAssertEqual(pages.max, 1)
		XCTAssertEqual(pages.current, 1)
		XCTAssertFalse(pages.hasMore())
	}
}
