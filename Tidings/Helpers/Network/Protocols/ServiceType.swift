//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Combine
import Foundation

protocol ServiceType {
	var session: URLSession { get }
	var decoder: JSONDecoder { get }

	func request<T: Decodable>(
		_ request: RequestType
	) throws -> AnyPublisher<T, NetworkError>
}
