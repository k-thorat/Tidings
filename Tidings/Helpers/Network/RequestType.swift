//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Foundation

protocol RequestType {
	var baseURL: URL { get }
	var headers: [String: String] { get }

	func path() -> String
	func urlRequest() -> URLRequest
}

extension RequestType {
	func urlRequest() -> URLRequest {
		var request = URLRequest(url: baseURL.appendingPathComponent(path()))
		request.allHTTPHeaderFields = headers
		return request
	}
}
