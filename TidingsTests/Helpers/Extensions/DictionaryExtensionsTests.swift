//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

@testable import Tidings
import XCTest

class DictionaryExtensionsTests: XCTestCase {
	func testMerge() {
		var firstTrilogy = ["IV": "Part 4", "V": "Part 5", "VI": "Part 6"]
		let secondTrilogy = ["I": "Part 1", "II": "Part 2", "III": "Part 3"]
		firstTrilogy.merge(dict: secondTrilogy)
		XCTAssertEqual(firstTrilogy.count, 6)
		XCTAssertEqual(firstTrilogy["I"], "Part 1")
	}

	func testMergeDuplicate() {
		var firstTrilogy = ["I": "Part 1", "II": "Part 2", "III": "Part 3"]
		let secondTrilogy = ["I": "Rogue", "Two": "Part Two", "III": "Part Three"]
		firstTrilogy.merge(dict: secondTrilogy)
		XCTAssertEqual(firstTrilogy.count, 4)
		XCTAssertEqual(firstTrilogy["I"], "Rogue")
		XCTAssertEqual(firstTrilogy["II"], "Part 2")
	}
}
