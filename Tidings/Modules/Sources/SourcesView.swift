//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import SwiftUI

struct SourcesView<ViewModel>: View where ViewModel: SourcesViewModelType {
	@ObservedObject var viewModel: ViewModel

	var body: some View {
		NavigationView {
			content
			.navigationBarTitle(Text(Localized.Module.sources.value()))
		}
		.onAppear {
			self.viewModel.send(event: .onAppear)
		}
	}

	private var content: some View {
		switch viewModel.state {
		case .idle:
			return Color.clear.eraseToAnyView()

		case .error(let error):
			return Text(error.localizedDescription).eraseToAnyView()

		case .loading:
			return loadingView().eraseToAnyView()

		case .loaded:
			return sourcesView().eraseToAnyView()
		}
	}

	private func loadingView() -> some View {
		List(viewModel.placeholders) {
			SourceCellView(source: $0)
				.redacted(reason: .placeholder)
		}
		.id(UUID())
	}

	private func sourcesView() -> some View {
		List(viewModel.dataSource.compactMap { $0 }) {
			SourceCellView(source: $0)
		}
		.id(UUID())
	}
}

extension SourcesView {
	func tab() -> some View {
		self
		.tabItem {
			Image(systemName: kSources.tabImage)
			Text(Localized.Module.sources.value())
		}
		.eraseToAnyView()
	}
}

// swiftlint:disable all
struct SourcesView_Previews: PreviewProvider {
	static var previews: some View {
		let model = SourcesViewModel(state: .loaded(Source.placeholders(2)))
		kSources.defaultView(model: model)
	}
}
