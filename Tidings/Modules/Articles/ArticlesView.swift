//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Combine
import SwiftUI

struct ArticlesView<ViewModel>: View where ViewModel: ArticlesViewModelType {
	@ObservedObject var viewModel: ViewModel
	@State private var isPresented: Bool = false
	@State private var selectedArticle: Article?

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

		case .error(let error):
			return Text(error.localizedDescription).eraseToAnyView()

		case .loading, .loaded:
			return articlesView().eraseToAnyView()
		}
	}

	private func articlesView() -> some View {
		List {
			ForEach(viewModel.dataSource.contents.compactMap { $0 }, id: \.self) { article in
				ArticleCellView(article: article)
				.onTapGesture {
					selectedArticle = article
					isPresented.toggle()
				}
				.onAppear {
					if viewModel.dataSource.contents.last == article {
						viewModel.send(event: .onNext)
					}
				}
			}
			ForEach(viewModel.dataSource.placeholders.compactMap { $0 }, id: \.self) {
				ArticleCellView(article: $0)
					.redacted(reason: .placeholder)
			}
		}
		.sheet(isPresented: $isPresented) { () -> SafariView? in
			guard let article = selectedArticle else {
				return nil
			}
			return SafariView(url: article.url)
		}
		.id(UUID())
	}
}

extension ArticlesView {
	func tab() -> some View {
		self
		.tabItem {
			Image(systemName: kArticle.tabImage)
			Text(Localized.Module.articles.value())
		}
		.eraseToAnyView()
	}
}

// swiftlint:disable all
struct ArticlesView_Previews: PreviewProvider {
    static var previews: some View {
		let model = ArticlesViewModel(state: .loaded(Article.placeholders(2)), pages: Pages(current: 1, max: 1))
		kArticle.defaultView(model: model)
    }
}
