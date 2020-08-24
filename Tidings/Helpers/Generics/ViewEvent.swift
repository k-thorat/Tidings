//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Foundation

enum ViewEvent {
	case onAppear
	case onLoaded
	case onNext
	case onFailed(Error)
}

extension ViewEvent: Equatable {
	static func == (lhs: ViewEvent, rhs: ViewEvent) -> Bool {
		switch (lhs, rhs) {
		case (.onAppear, .onAppear):
			return true

		case (.onLoaded, .onLoaded):
			return true

		case (.onNext, .onNext):
			return true

		case let (onFailed(error1), .onFailed(error2)):
			return ErrorUtils.isEqual(error1, error2)

		default:
			return false
		}
	}
}
