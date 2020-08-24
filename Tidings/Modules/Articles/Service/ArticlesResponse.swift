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
		let title: String?
		let description: String?
		let url: URL?
		let urlToImage: URL?
		let publishedAt: String?
		let content: String?
	}

	let status: String?
	let totalResults: Int
	let articles: [Throwable<Article>]
}
