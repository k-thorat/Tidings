//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Combine
import SwiftUI

enum ArticlesService {
	static func get(page: Int) throws -> AnyPublisher<ArticlesResponse, NetworkError> {
		let request = ArticlesRequest(page: page, country: .australia)
		return try Service().request(request)
	}
}
