//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Foundation

struct ArticlesResponse: Decodable {
	struct Article: Decodable {
		struct Source: Decodable {
			let id: String?
			let name: String?
		}

		let source: Source?
		let author: String?
		let title: String
		let description: String?
		let publishedAt: String?
		let content: String?

		// swiftlint:disable let_var_whitespace // Bug in swiftlint
		@ValidateURL(wrappedValue: nil, elements: [.scheme])
		var url: URL?

		@ValidateURL(wrappedValue: nil, elements: [.scheme])
		var urlToImage: URL?
	}

	let status: String?
	let totalResults: Int
	let articles: [Throwable<Article>]
}
