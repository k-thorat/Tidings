//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

@testable import Tidings
import XCTest

class ThrowableTests: XCTestCase {

	struct Test: Decodable {
		let name: String
	}

	func testThrowable() {
		let response = """
		[
			{ "name": 1 },
			{ "name": "Banana" },
			{ "name": 1 }
		]
		"""

		var result: [Throwable<Test>]?
		var decodingError: Error?

		do {
			result = try response.data(using: .utf8).flatMap {
				try JSONDecoder().decode([Throwable<Test>].self, from: $0)
			}
		} catch {
			decodingError = error
		}

		XCTAssertNil(decodingError)
		XCTAssertEqual(result?.compactMap { $0.value }.first?.name, "Banana")
	}
}

