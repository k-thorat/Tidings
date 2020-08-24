//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Combine
import Foundation

struct Service: ServiceType {
	let session: URLSession
	let decoder: JSONDecoder

	init(session: URLSession = .shared, decoder: JSONDecoder = JSONDecoder()) {
		self.session = session
		self.decoder = decoder
	}

	func request<T: Decodable>(
		_ request: RequestType
	) throws -> AnyPublisher<T, NetworkError> {
		guard Reachability.status() != .notReachable else {
			throw NetworkError.notConnected
		}

		return
			session
			.dataTaskPublisher(for: try request.urlRequest())
			.tryMap { element -> Data in
				guard element.response.isValid() else {
					throw NetworkError.invalidStatusCode
				}
				return element.data
			}
			.decode(type: T.self, decoder: decoder)
			.mapError { NetworkError.map($0) }
			.eraseToAnyPublisher()
	}
}
