//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Foundation

struct SourcesResponse: Decodable {
	struct Source: Codable {
		let id: String
		let name: String
		let description: String?
		let url: URL
		let category: String?
		let language: String?
		let country: String?
	}

	let status: String
	let sources: [Throwable<Source>]
}
