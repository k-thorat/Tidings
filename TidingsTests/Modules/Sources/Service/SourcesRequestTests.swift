//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

@testable import Tidings
import XCTest

class SourcesRequestTests: XCTestCase {
	func testRequestPath() {
		let baseURL: String = Bundle.main.get(key: .baseURL)
		let request = SourcesRequest()

		let path = "\(API.Endpoint.sources.rawValue)"
		XCTAssertEqual(request.path(), path)

		let urlRequest = try! request.urlRequest()

		XCTAssertEqual(urlRequest.url, URL(string: "\(baseURL)\(path)?")!)
		XCTAssertEqual(urlRequest.allHTTPHeaderFields, API.authHeader)
	}
}
