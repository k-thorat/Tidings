//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Combine
import SwiftUI

final class SourcesViewModel: SourcesViewModelType {
	@Published private(set) var state: ViewState<[Source]>
	@Published private(set) var dataSource = SafeArray<Source>()
	let placeholders = Source.placeholders(kSources.placeholderSize)

	private var subscriptions = Set<AnyCancellable>()
	private let response = PassthroughSubject<ArticlesResponse, Never>()
	private let input = PassthroughSubject<ViewEvent<[Source]>, Never>()

	init(
		state: ViewState<[Source]> = .idle
	) {
		self.state = state
		Publishers.system(
			initial: state,
			reduce: ReduceUtil.reduce,
			scheduler: DispatchQueue.main,
			feedbacks: [
				whenLoading(),
				Feedback<[Source], [Source]>.userInput(input: input.eraseToAnyPublisher())
			]
		)
		.assignNoRetain(to: \.state, on: self)
		.store(in: &subscriptions)

		observeState()
	}

	func send(event: ViewEvent<[Source]>) {
		input.send(event)
	}

	deinit {
		subscriptions.removeAll()
	}
}

private extension SourcesViewModel {
	func whenLoading() -> Feedback<ViewState<[Source]>, ViewEvent<[Source]>> {
		Feedback { (state: ViewState) -> AnyPublisher<ViewEvent<[Source]>, Never> in
			guard case .loading = state else {
				return Empty().eraseToAnyPublisher()
			}

			do {
				return try SourcesService.get()
					.map { $0.sources.compactMap(Source.init) }
					.map(ViewEvent.onLoaded)
					.catch { Just(ViewEvent.onFailed($0)) }
					.eraseToAnyPublisher()
			} catch {
				return Just(ViewEvent.onFailed(error))
					.eraseToAnyPublisher()
			}
		}
	}

	func observeState() {
		$state.sink { [weak self] in
			guard let self = self else {
				return
			}
			switch $0 {
			case .loaded(let updated):
				self.dataSource.append(updated)

			default:
				break
			}
		}
		.store(in: &subscriptions)
	}
}
