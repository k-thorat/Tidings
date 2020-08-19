//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Foundation

class ServiceOperation<T: Decodable>: AsyncOperation {
	let request: RequestType
	let session: URLSession
	let decoder: JSONDecoder
	let completion: (_ response: Result<T, Error>) -> Void
	private var task: URLSessionDataTask?

	init(
		_ request: RequestType,
		session: URLSession = URLSession.shared,
		decoder: JSONDecoder = JSONDecoder(),
		completion: @escaping (_ response: Result<T, Error>) -> Void
	) {
		self.request = request
		self.session = session
		self.decoder = decoder
		self.completion = completion
		super.init()
	}

	override func start() {
		super.start()
		task = Service().request(request) { [weak self] in
			self?.completed(response: $0)
		}
	}

	override func cancel() {
		super.cancel()
		task?.cancel()
	}

	private func completed(response: Result<T, Error>) {
		if !isCancelled {
			completion(response)
		}
		finish()
	}
}
