//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Foundation

enum ViewEvent<Element: Equatable> {
	case onAppear
	case onLoaded(Element)
	case onNext
	case onFailed(Error)
}

extension ViewEvent: Equatable {
	static func == (lhs: ViewEvent, rhs: ViewEvent) -> Bool {
		switch (lhs, rhs) {
		case (.onAppear, .onAppear):
			return true

		case let (.onLoaded(element1), .onLoaded(element2)):
			return element1 == element2

		case (.onNext, .onNext):
			return true

		case let (onFailed(error1), .onFailed(error2)):
			return ErrorUtils.isEqual(error1, error2)

		default:
			return false
		}
	}
}
