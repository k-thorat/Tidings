//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Foundation

enum ReduceUtil {
	static func reduce<Element: Equatable>(
		_ state: ViewState<Element>, _ event: ViewEvent<Element>
	) -> ViewState<Element> {
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

			case .onLoaded(let element):
				return .loaded(element)

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
