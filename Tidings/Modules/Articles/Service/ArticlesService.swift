//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Combine
import SwiftUI

enum ArticlesService {
	static func get(page: Int) throws -> AnyPublisher<ArticlesResponse, NetworkError> {
		let queryItems = [
			URLQueryItem(name: API.Query.country.rawValue, value: "au"),
			URLQueryItem(name: API.Query.pageSize.rawValue, value: String(kArticle.pageSize)),
			URLQueryItem(name: API.Query.country.rawValue, value: String(page))
		]
		let request = ArticlesRequest(queryItems: queryItems)
		return try Service().request(request)
	}
}
