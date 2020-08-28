//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

@testable import Tidings
import XCTest

class ValidateURLTests: XCTestCase {

	@ValidateURL
	var validateAll: URL? = nil

	@ValidateURL(wrappedValue: nil, elements: [URLElements.scheme])
	var validateScheme: URL?

	@ValidateURL(wrappedValue: nil, elements: [URLElements.host])
	var validateHost: URL?

	override func setUp() {
		super.setUp()
		validateAll = nil
		validateScheme = nil
		validateHost = nil
	}

	func testValidateAll() {
		validateAll = URL(string: "https://www.validURL.com")!
		XCTAssertNotNil(validateAll)
	}

	func testValidateScheme() {
		validateScheme = URL(string: "www.validURL.com")!
		XCTAssertNil(validateScheme)
	}

	func testValidateHost() {
		validateHost = URL(string: "https://")!
		XCTAssertNil(validateHost)
	}
}
