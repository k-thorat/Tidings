//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Foundation

struct Pages {
	var current: Int
	var max: Int?

	init(current: Int = 0, max: Int? = nil) {
		self.current = current
		self.max = max
	}

	mutating func increment(results: Int) {
		current += 1
		if max == nil {
			max = Int(ceil(Double(results) / Double(kArticle.pageSize)))
		}
	}

	func hasMore() -> Bool {
		guard let max = max else {
			return true
		}
		return current < max
	}
}
