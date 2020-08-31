//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

@testable import Tidings
import XCTest

class SourcesResponseTests: XCTestCase {
    func testResponseValid() {
        let testResponse =
		"""
		{
		"status": "ok",
			"sources": [
			{
				"id": "abc-news",
				"name": "ABC News",
				"description": "Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com.",
				"url": "https://abcnews.go.com",
				"category": "general",
				"language": "en",
				"country": "us"
			},
			{
				"id": "abc-news-au",
				"name": "ABC News (AU)",
				"description": "Australia's most trusted source of local, national and world news. Comprehensive, independent, in-depth analysis, the latest business, sport, weather and more.",
				"url": "http://www.abc.net.au/news",
				"category": "general",
				"language": "en",
				"country": "au"
			}
			]
		}
		"""

		var result: SourcesResponse?
		var decodingError: Error?

		do {
			result = try testResponse.data(using: .utf8).flatMap {
				try JSONDecoder().decode(SourcesResponse.self, from: $0)
			}
		} catch {
			decodingError = error
		}

		XCTAssertNil(decodingError)
		XCTAssertNotNil(result)
		XCTAssertEqual(result?.sources.count, 2)
    }

	func testResponseInvalid() {
		let testResponse =
		"""
		{
		"status": "ok",
			"sources": [
			{
				"id": "abc-news",
				"name": "Name",
				"description": "Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com.",
				"url": "https://abcnews.go.com",
				"category": "general",
				"language": "en",
				"country": "us"
			},
			{
				"id": null,
				"name": "ABC News (AU)",
				"description": "Australia's most trusted source of local, national and world news. Comprehensive, independent, in-depth analysis, the latest business, sport, weather and more.",
				"url": "http://www.abc.net.au/news",
				"category": "general",
				"language": "en",
				"country": "au"
			}
			]
		}
		"""

		var result: SourcesResponse?
		var decodingError: Error?

		do {
			result = try testResponse.data(using: .utf8).flatMap {
				try JSONDecoder().decode(SourcesResponse.self, from: $0)
			}
		} catch {
			decodingError = error
		}

		XCTAssertNil(decodingError)
		XCTAssertNotNil(result)
		let mapped = result?.sources.compactMap { $0.value } ?? []
		XCTAssertEqual(mapped.count, 1)
		XCTAssertEqual(mapped.first?.name, "Name")
	}
}
