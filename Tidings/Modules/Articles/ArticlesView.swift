//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Combine
import SwiftUI

struct ArticlesView: View {
	@ObservedObject private var viewModel: ArticlesViewModel

    var body: some View {
		NavigationView {
			content
			.navigationBarTitle(Text(Localized.Module.articles.value()))
		}.onAppear {
			self.viewModel.send(event: .onAppear)
		}
	}

	private var content: some View {
		switch viewModel.state {
		case .idle:
			return Color.clear.eraseToAnyView()

		case .loading:
			return articlesView(isLoading: true).eraseToAnyView()

		case .error(let error):
			return Text(error.localizedDescription).eraseToAnyView()

		case .loaded:
			return articlesView(isLoading: false).eraseToAnyView()
		}
	}

	private func articlesView(isLoading: Bool) -> some View {
		List {
			ForEach(viewModel.articles.compactMap { $0 }, id: \.self) { article in
				NavigationLink(destination: ContentView()) {
					ArticleCellView(article: article)
				}.onAppear {
					if viewModel.articles.last == article {
						viewModel.send(event: .onNext)
					}
				}
			}
			if isLoading, viewModel.hasMore(), let article = Article.placeholder() {
				ArticleCellView(article: article)
					.redacted(reason: .placeholder)
			}
		}
	}

	private func loadingView() -> some View {
		let articles = Array(repeating: Article.placeholder(),
							 count: kArticle.pageSize)
						.compactMap { $0 }
		return List(articles) { article in
			ArticleCellView(article: article)
				.redacted(reason: .placeholder)
		}
	}
}

extension ArticlesView {
	static func tab() -> some View {
		ArticlesView(viewModel: ArticlesViewModel())
			.tabItem {
				Image(systemName: "phone")
				Text(Localized.Module.articles.value())
			}
	}
}

struct ArticlesView_Previews: PreviewProvider {
    static var previews: some View {
		ArticlesView.tab()
    }
}
