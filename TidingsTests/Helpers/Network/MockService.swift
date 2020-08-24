//
//  Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Foundation
import XCTest
@testable import Tidings

//struct MockService: ServiceType {
//	let session: URLSession
//	let decoder: JSONDecoder
//
//	init(session: URLSession,
//		 decoder: JSONDecoder
//	) {
//		self.session = session
//		self.decoder = decoder
//	}
//
//	func request<T>(
//		_ request: RequestType,
//		completion: @escaping (RequestType, Result<T, Error>) -> Void)
//	-> Cancelable? where T : Decodable {
//		session.dataTask(with: request.urlRequest()) { data, response, error in
//			if let session = session as? MockURLSession {
//				if let error = session.error {
//					completion(request, .failure(error))
//					return
//				}
//				guard
//					let data = data,
//					let response = response,
//					response.isStatusValid(),
//					let value = try? decoder.decode(T.self, from: data)
//				else {
//					completion(request, .failure(NetworkError.invalidResponse))
//					return
//				}
//				completion(request, .success(value))
//			} else {
//				XCTFail("Invalid Session, should be MockURLSession")
//			}
//		}
//		return MockCancelable()
//	}
//}
