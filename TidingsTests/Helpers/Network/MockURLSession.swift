//
//  Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Foundation
@testable import Tidings

//todo: use url protocol
class MockURLSession: URLSession {
	let data: Data?
	let response: URLResponse?
	let error: Error?
	let respondAfterSec: Int

	required init(
		data: Data? = nil,
		response: URLResponse? = nil,
		error: Error? = nil,
		respondAfterSec: Int = 0
	) {
		self.data = data
		self.response = response
		self.error = error
		self.respondAfterSec = respondAfterSec
		super.init()
	}

	override func dataTask(
		with request: URLRequest,
		completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void
	) -> URLSessionDataTask {
		return MockURLSessionDataTask { [weak self] in
			let delay = DispatchTimeInterval.seconds(self?.respondAfterSec ?? 0)
			DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + delay) {
				completionHandler(self?.data, self?.response, self?.error)
			}
		}
	}
}
