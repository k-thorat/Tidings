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
