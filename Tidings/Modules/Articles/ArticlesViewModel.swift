//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Combine
import SwiftUI

final class ArticlesViewModel: ObservableObject {
	@Published private(set) var state: ViewState
	@Published private(set) var articles = SyncedArray<Article>()

	private var page: Page
	private var subscriptions = Set<AnyCancellable>()
	private let input = PassthroughSubject<ViewEvent, Never>()

	init(
		state: ViewState = .idle,
		page: Page = Page()
	) {
		self.state = state
		self.page = page
		Publishers.system(
			initial: state,
			reduce: type(of: state).reduce,
			scheduler: DispatchQueue.main,
			feedbacks: [
				whenLoading(),
				Feedback<[Article], [Article]>.userInput(input: input.eraseToAnyPublisher())
			]
		)
		.assignNoRetain(to: \.state, on: self)
		.store(in: &subscriptions)
	}

	func send(event: ViewEvent) {
		input.send(event)
	}

	func hasMore() -> Bool {
		page.hasMore()
	}

	deinit {
		subscriptions.removeAll()
	}
}

private extension ArticlesViewModel {
	func whenLoading() -> Feedback<ViewState, ViewEvent> {
		Feedback { [weak self] (state: ViewState) -> AnyPublisher<ViewEvent, Never> in
			guard case .loading = state,
				  (self?.page.hasMore() ?? true) else {
				return Empty().eraseToAnyPublisher()
			}

			do {
				return try ArticlesService.get(page: (self?.page.current ?? 0) + 1)
					.map {
						self?.handleResponse($0)
						return ViewEvent.onLoaded
					}
					.catch { Just(ViewEvent.onFailed($0)) }
					.eraseToAnyPublisher()
			} catch {
				return Just(ViewEvent.onFailed(error))
					.eraseToAnyPublisher()
			}
		}
	}

	func handleResponse(_ response: ArticlesResponse) {
		page = page.increment(totalResults: response.totalResults)
		articles.append(response.articles.compactMap(Article.init))
	}
}
