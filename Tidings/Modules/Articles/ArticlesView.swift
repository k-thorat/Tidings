//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Combine
import SwiftUI

struct ArticlesView<ViewModel>: View where ViewModel: ArticlesViewModelType {
	@ObservedObject var viewModel: ViewModel

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
				NavigationLink(destination: ContentView()) {
					ArticleCellView(article: article)
				}.onAppear {
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
	}
}

extension ArticlesView {
	func tab() -> some View {
		self
		.tabItem {
			Image(systemName: "phone")
			Text(Localized.Module.articles.value())
		}
		.eraseToAnyView()
	}
}

struct ArticlesView_Previews: PreviewProvider {
    static var previews: some View {
		kArticle.defaultView()
    }
}
