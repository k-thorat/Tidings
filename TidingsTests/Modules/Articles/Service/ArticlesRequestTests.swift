//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

@testable import Tidings
import XCTest

class ArticlesRequestTests: XCTestCase {
	func testRequestPath() {
		let baseURL: String = Bundle.main.get(key: .baseURL)

		let request = ArticlesRequest(page: 1, country: API.Query.Country.australia)

		let path = "\(API.Endpoint.headlines.rawValue)"
		XCTAssertEqual(request.path(), path)

		let urlRequest = try! request.urlRequest()

		XCTAssertEqual(urlRequest.url, URL(string: "\(baseURL)\(path)?country=au&pageSize=10&page=1")!)
		XCTAssertEqual(urlRequest.allHTTPHeaderFields, API.authHeader)
	}
}
