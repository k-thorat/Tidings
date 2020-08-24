//
//  Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Foundation
@testable import Tidings

struct TestRequest: RequestType {
	var baseURL: URL
	var headers: [String : String]

	init(baseURL: URL = URL(string: "https://www.apple.com")!,
		 headers: [String : String] = [:]) {
		self.baseURL = baseURL
		self.headers = headers
	}

	func path() -> String {
		return baseURL.absoluteString
	}
}
