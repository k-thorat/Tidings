//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

@testable import Tidings
import XCTest

class ErrorUtilTests: XCTestCase {
	func testErrorCompare() {
		XCTAssertTrue(ErrorUtils.isEqual(NetworkError.invalidRequest, NetworkError.invalidRequest))
		XCTAssertFalse(ErrorUtils.isEqual(NetworkError.invalidRequest, NetworkError.invalidResponse))
	}

	func testErrorCompareCode() {
		let error1 = NSError(domain: "Error", code: 1, userInfo: nil)
		let error2 = NSError(domain: "Error", code: 1, userInfo: nil)
		XCTAssertTrue(ErrorUtils.isEqual(error1, error2))

		let error3 = NSError(domain: "Error", code: 1, userInfo: nil)
		let error4 = NSError(domain: "Error", code: 2, userInfo: nil)
		XCTAssertFalse(ErrorUtils.isEqual(error3, error4))
	}

	func testErrorCompareDomain() {
		let error1 = NSError(domain: "Error", code: 1, userInfo: nil)
		let error2 = NSError(domain: "Error", code: 1, userInfo: nil)
		XCTAssertTrue(ErrorUtils.isEqual(error1, error2))

		let error3 = NSError(domain: "Error1", code: 1, userInfo: nil)
		let error4 = NSError(domain: "Error2", code: 1, userInfo: nil)
		XCTAssertFalse(ErrorUtils.isEqual(error3, error4))
	}

	func testErrorCompareUserInfo() {
		let error1 = NSError(domain: "Error", code: 1, userInfo: ["A": "B"])
		let error2 = NSError(domain: "Error", code: 1, userInfo: ["A": "B"])
		XCTAssertTrue(ErrorUtils.isEqual(error1, error2))

		let error3 = NSError(domain: "Error", code: 1, userInfo: ["A": "B"])
		let error4 = NSError(domain: "Error", code: 1, userInfo: ["C": "D"])
		XCTAssertFalse(ErrorUtils.isEqual(error3, error4))
	}
}

