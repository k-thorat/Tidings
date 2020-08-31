//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Combine
import SwiftUI

struct ArticlesRequest: RequestType {
	let baseURL: URL? = nil
	let endpoint: API.Endpoint = .headlines
	let headers: [String: String] = [:]
	let queryItems: [URLQueryItem]
}

extension ArticlesRequest {
	init(page: Int, country: API.Query.Country = .australia) {
		self.queryItems = [
			URLQueryItem(name: API.Query.country.rawValue, value: country.rawValue),
			URLQueryItem(name: API.Query.pageSize.rawValue, value: String(kArticle.pageSize)),
			URLQueryItem(name: API.Query.page.rawValue, value: String(page))
		]
	}
}
