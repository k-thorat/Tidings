//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Foundation

enum ViewState {
	case error(Error)
	case idle
	case loading
	case loaded

	static func reduce(_ state: ViewState, _ event: ViewEvent) -> ViewState {
		switch state {
		case .idle:
			switch event {
			case .onAppear:
				return .loading

			default:
				return state
			}

		case .loading:
			switch event {
			case .onFailed(let error):
				return .error(error)

			case .onLoaded:
				return .loaded

			default:
				return state
			}

		case .loaded:
			switch event {
			case .onNext:
				return .loading

			default:
				return state
			}

		case .error:
			return state
		}
	}
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

		case (.loaded, .loaded):
			return true

		default:
			return false
		}
	}
}
