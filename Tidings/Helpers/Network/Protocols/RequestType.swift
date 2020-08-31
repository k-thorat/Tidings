//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Foundation

protocol RequestType {
	var baseURL: URL? { get }
	var endpoint: API.Endpoint { get }
	var headers: [String: String] { get }
	var queryItems: [URLQueryItem] { get }
	//var constrainedAccess: Bool { get }
	func path() -> String
	func urlRequest() throws -> URLRequest
}

extension RequestType {
	func path() -> String {
		endpoint.rawValue
	}

	func urlRequest() throws -> URLRequest {
		guard let base = baseURL ?? URL(string: Bundle.main.get(key: .baseURL)) else {
			throw NetworkError.invalidRequest
		}

		var components = URLComponents(
			url: base.appendingPathComponent(path()),
			resolvingAgainstBaseURL: true
		)
		components?.queryItems = queryItems

		guard let url = components?.url else {
			throw NetworkError.invalidRequest
		}

		var request = URLRequest(url: url)
		var allHeader = API.authHeader
		allHeader.merge(dict: headers)
		request.allHTTPHeaderFields = allHeader
		return request
	}
}
