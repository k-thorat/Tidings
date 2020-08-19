//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Foundation

extension URLResponse {
	func isStatusValid() -> Bool {
		guard let response = self as? HTTPURLResponse else {
			return false
		}
		let range: Range<Int> = 200..<299
		return range.contains(response.statusCode)
	}
}
