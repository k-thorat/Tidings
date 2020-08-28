//
//  Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Foundation
@testable import Tidings

struct TestRequest: RequestType {
	var baseURL: URL?

	var endpoint: API.Endpoint

	var queryItems: [URLQueryItem]

	var headers: [String : String]

	init(baseURL: URL = URL(string: "https://www.apple.com")!,
		 endpoint: API.Endpoint = .headlines,
		 queryItems: [URLQueryItem] = [],
		 headers: [String : String] = [:]) {
		self.baseURL = baseURL
		self.endpoint = endpoint
		self.queryItems = queryItems
		self.headers = headers
	}
}
