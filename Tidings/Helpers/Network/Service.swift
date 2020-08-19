//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Foundation

struct Service {
	func request<T: Decodable>(
		_ request: RequestType,
		session: URLSession = URLSession.shared,
		decoder: JSONDecoder = JSONDecoder(),
		completion: @escaping (_ response: Result<T, Error>) -> Void
	) -> URLSessionDataTask? {
		guard Reachability.status() != .notReachable else {
			completion(.failure(NetworkError.notConnected))
			return nil
		}

		let task =
			session
			.dataTask(with: request.urlRequest()) { data, response, error in
				if let error = error {
					completion(.failure(error))
					return
				}
				guard
					let data = data,
					let response = response,
					response.isStatusValid(),
					let value = try? decoder.decode(T.self, from: data)
				else {
					completion(.failure(NetworkError.invalidResponse))
					return
				}
				completion(.success(value))
			}

		task.resume()
		return task
	}
}
