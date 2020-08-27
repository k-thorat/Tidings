//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Foundation
import KingfisherSwiftUI
import SwiftUI

struct ArticleCellView: View {
	let article: Article
	private let viewPadding: CGFloat = 10.0
	private let imageWidth: CGFloat = 100.0
	private let imageRatio: CGFloat = 0.75

	var body: some View {
		HStack {
			VStack(alignment: .leading) {
				thumbnail
			}

			VStack(alignment: .leading) {
				title
					.padding(.bottom, viewPadding / 2)
				subtitle
			}.padding(viewPadding)
		}
	}

	private var thumbnail: some View {
		KFImage(article.image)
			.placeholder {
				Image(systemName: kArticle.placeholderImage)
			}
			.cancelOnDisappear(true)
			.resizable()
			.aspectRatio(imageRatio, contentMode: .fit)
			.frame(width: imageWidth)
			.clipped()
	}

	private var title: some View {
		Text(article.title)
			.lineLimit(3)
			.modifier(TitleStyle())
	}

	private var subtitle: some View {
		guard let subtitle = article.subtitle else {
			return EmptyView().eraseToAnyView()
		}
		return Text(subtitle)
			.lineLimit(1)
			.modifier(SubtitleStyle())
			.eraseToAnyView()
	}
}

// swiftlint:disable all
struct ArticleCellView_Previews: PreviewProvider {
	static var previews: some View {
		let articles = Article.placeholders(1)
		List(articles) {
			ArticleCellView(article: $0)
		}
	}
}
