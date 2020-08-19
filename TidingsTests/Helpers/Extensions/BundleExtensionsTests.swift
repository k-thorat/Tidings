//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

@testable import Movies
import XCTest

class BundleExtensionsTests: XCTestCase {
	func testVerifyKeys() {
		let baseURL: String = Bundle.main.get(key: .baseURL)
		XCTAssertNotNil(baseURL) 
	}
}
