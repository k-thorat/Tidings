//
//  Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Foundation
@testable import Tidings

class MockURLSessionDataTask: URLSessionDataTask {
	private let closure: () -> Void

	init(closure: @escaping () -> Void) {
		self.closure = closure
	}

	// We override the 'resume' method and simply call our closure
	// instead of actually resuming any task.
	override func resume() {
		closure()
	}
}
