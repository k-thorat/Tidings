//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Foundation
import SwiftUI

struct Source: Identifiable, Equatable, Hashable {
	let id: String
	let title: String
	let subtitle: String
	let url: URL
}

extension Source {
	init?(response: Throwable<SourcesResponse.Source>) {
		guard let source = response.value else {
			return nil
		}
		self.id = UUID().uuidString
		self.title = source.name
		self.subtitle = source.description ?? ""
		self.url = source.url
	}

	static func placeholders(_ count: Int = 1) -> [Source] {
		guard let url = URL(string: "https://www.apple.com") else {
			return []
		}
		// swiftlint:disable non_localized_sentence
		return Array(0..<count).map {
			Source(id: String($0),
				   title: "Source Name",
				   subtitle: UUID().uuidString,
				   url: url)
		}
	}
}
