//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Combine
import SwiftUI

final class ArticlesViewModel: ArticlesViewModelType {
	@Published private(set) var state: ViewState<[Article]>
	@Published private(set) var dataSource = (contents: SyncedArray<Article>(),
											  placeholders: SyncedArray<Article>())

	private var pages: Pages
	private var subscriptions = Set<AnyCancellable>()
	private let response = PassthroughSubject<ArticlesResponse, Never>()
	private let input = PassthroughSubject<ViewEvent<[Article]>, Never>()

	init(
		state: ViewState<[Article]> = .idle,
		pages: Pages = Pages()
	) {
		self.state = state
		self.pages = pages
		Publishers.system(
			initial: state,
			reduce: ViewState<[Article]>.reduce,
			scheduler: DispatchQueue.main,
			feedbacks: [
				whenLoading(),
				Feedback<[Article], [Article]>.userInput(input: input.eraseToAnyPublisher())
			]
		)
		.assignNoRetain(to: \.state, on: self)
		.store(in: &subscriptions)

		observeState()
		observeResponse()
	}

	func send(event: ViewEvent<[Article]>) {
		input.send(event)
	}

	deinit {
		subscriptions.removeAll()
	}
}

private extension ArticlesViewModel {
	func whenLoading() -> Feedback<ViewState<[Article]>, ViewEvent<[Article]>> {
		Feedback { [weak self] (state: ViewState) -> AnyPublisher<ViewEvent<[Article]>, Never> in
			guard let self = self,
				  case .loading = state,
				  self.pages.hasMore() else {
				return Empty().eraseToAnyPublisher()
			}

			do {
				return try ArticlesService.get(page: self.pages.current + 1)
					.map { [weak self] in
						self?.response.send($0)
						return $0.articles.compactMap(Article.init)
					}
					.map(ViewEvent.onLoaded)
					.catch {
						Just(ViewEvent.onFailed($0))
					}
					.eraseToAnyPublisher()
			} catch {
				return Just(ViewEvent.onFailed(error))
					.eraseToAnyPublisher()
			}
		}
	}

	func observeResponse() {
		response.sink { [weak self] in
			guard let self = self else {
				return
			}
			self.pages.increment(results: $0.totalResults)
		}
		.store(in: &subscriptions)
	}

	func observeState() {
		$state.sink { [weak self] in
			guard let self = self else {
				return
			}
			switch $0 {
			case .loading:
				let count = self.pages.hasMore()
							? self.dataSource.contents.isEmpty ? kArticle.pageSize / 2 : 1
							: 0
				let array = Array(repeating: Article.placeholder(), count: count).compactMap { $0 }
				self.dataSource.placeholders = SyncedArray(array)

			case .loaded(let updated):
				self.dataSource.contents.append(updated)

			default:
				break
			}
		}
		.store(in: &subscriptions)
	}
}
