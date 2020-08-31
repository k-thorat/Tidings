//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

@testable import Tidings
import XCTest

class URLResponseExtensionsTests: XCTestCase {
	func testValidResponse() {
		validate(
			statusCodes: [200, 201, 298],
			expectedResult: true
		)
	}

	func testInValidResponse() {
		validate(
			statusCodes: [199, 299, 400, 503],
			expectedResult: false
		)
	}

	func testInValidObject() {

		let url = URL(string: "https://www.apple.com")!

		let response = URLResponse(
			url: url,
			mimeType: nil,
			expectedContentLength: 0,
			textEncodingName: nil
		)

		XCTAssertEqual(response.isValid(), false)
	}
}

extension URLResponseExtensionsTests {
	private func validate(
		statusCodes: [Int],
		expectedResult: Bool
	) {
		let url = URL(string: "https://www.apple.com")!

		let responses: [HTTPURLResponse] = statusCodes.map {
			return HTTPURLResponse(
				url: url,
				statusCode: $0,
				httpVersion: nil,
				headerFields: nil
				)!
		}

		for response in responses {
			XCTAssertEqual(
				response.isValid(), expectedResult,
				"Status: \(response.statusCode) Expected:\(expectedResult) Returned: \(response.isValid())"
			)
		}
	}
}
