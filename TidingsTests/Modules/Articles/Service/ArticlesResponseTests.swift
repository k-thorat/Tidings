//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

@testable import Tidings
import XCTest

class ArticlesResponseTests: XCTestCase {
    func testResponseValid() {
        let testResponse =
		"""
		{
		"status": "ok",
		"totalResults": 10,
		"articles": [
			{
			"source": {
			"id": "bbc-news",
			"name": "BBC News"
			},
			"author": null,
			"title": "Valid url",
			"description": null,
			"url": "https://www.apple.com",
			"urlToImage": null,
			"content": null,
			"publishedAt": "2020-07-26T14:07:56Z"
			}
		]
		}
		"""

		var result: ArticlesResponse?
		var decodingError: Error?

		do {
			result = try testResponse.data(using: .utf8).flatMap {
				try JSONDecoder().decode(ArticlesResponse.self, from: $0)
			}
		} catch {
			decodingError = error
		}

		XCTAssertNil(decodingError)
		XCTAssertNotNil(result)
		XCTAssertEqual(result?.articles.count, 1)
		XCTAssertNil(result?.articles.first?.value?.urlToImage)
    }

	func testResponsePartialInvalid() {
		let testResponse =
		"""
		{
		"status": "ok",
		"totalResults": 10,
		"articles": [
			{
			"source": {
			"id": "bbc-news",
			"name": "BBC News"
			},
			"author": null,
			"title": "Valid url",
			"description": null,
			"url": "https://www.apple.com",
			"urlToImage": null,
			"content": null,
			"publishedAt": "2020-07-26T14:07:56Z"
			}
		]
		}
		"""

		var result: ArticlesResponse?
		var decodingError: Error?

		do {
			result = try testResponse.data(using: .utf8).flatMap {
				try JSONDecoder().decode(ArticlesResponse.self, from: $0)
			}
		} catch {
			decodingError = error
		}

		XCTAssertNil(decodingError)
		XCTAssertNotNil(result)
		let mapped = result?.articles.compactMap { $0.value } ?? []
		XCTAssertEqual(mapped.count, 1)
		XCTAssertEqual(mapped.first?.source?.name, "BBC News")
		XCTAssertNil(mapped.first?.urlToImage)
	}
}
