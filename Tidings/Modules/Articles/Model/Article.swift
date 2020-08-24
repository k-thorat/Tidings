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
		self.url = url
	}

	// swiftlint:disable non_localized_sentence
	static func placeholder() -> Article? {
		guard let url = URL(string: "https://www.apple.com") else {
			return nil
		}
		return Article(id: UUID().uuidString,
					   image: url,
					   title: "Article Title placeholder for Loading",
					   url: url)
	}
	// swiftlint:enable non_localized_sentence
}
