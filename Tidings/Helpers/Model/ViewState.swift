//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Foundation

enum ViewState<Element: Equatable> {
	case error(Error)
	case idle
	case loading
	case loaded(Element)
}

extension ViewState: Equatable {
	static func == (lhs: ViewState, rhs: ViewState) -> Bool {
		switch (lhs, rhs) {
		case let (error(error1), .error(error2)):
			return ErrorUtils.isEqual(error1, error2)

		case (.idle, .idle):
			return true

		case (.loading, .loading):
			return true

		case let (.loaded(element1), .loaded(element2)):
			return element1 == element2

		default:
			return false
		}
	}
}
