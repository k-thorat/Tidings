//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Foundation

struct Page {
	let current: Int
	let max: Int?

	init(current: Int = 0, max: Int? = nil) {
		self.current = current
		self.max = max
	}

	func increment(totalResults: Int) -> Page {
		//todo: property wrapper for set if nil?
		let max = self.max == nil
			? Int(ceil(Double(totalResults) / Double(kArticle.pageSize)))
			: self.max
		return Page(current: current + 1, max: max)
	}

	func hasMore() -> Bool {
		guard let max = max else {
			return true
		}
		return current < max
	}
}
