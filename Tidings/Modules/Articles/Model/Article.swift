//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Foundation
import SwiftUI

struct Article: Identifiable, Equatable, Hashable {
	let id: String
	let image: URL?
	let title: String
	let subtitle: String?
	let url: URL
}

extension Article {
	init?(response: Throwable<ArticlesResponse.Article>) {
		guard let value = response.value,
			  let url = value.url,
			  let title = value.title else {
			return nil
		}
		self.id = UUID().uuidString
		self.image = value.urlToImage
		self.title = title
		self.subtitle = value.source?.name
		self.url = url
	}

	static func placeholders(_ count: Int = 1) -> [Article] {
		guard let image = Bundle.main.url(forResource: kArticle.placeholderImage, withExtension: "jpg") else {
			return []
		}
		// swiftlint:disable non_localized_sentence
		return Array(0..<count).map {
			Article(id: String($0),
					image: image,
					title: UUID().uuidString,
					subtitle: "News Source",
					url: image)
		}
	}
}
