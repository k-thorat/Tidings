//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Foundation

enum URLElements {
	case scheme
	case host
}

@propertyWrapper
struct ValidateURL {
	let elements: [URLElements]

	var wrappedValue: URL? {
		didSet {
			if !ValidateURL.isValid(url: wrappedValue, for: elements) {
				wrappedValue = nil
			}
		}
	}
}

extension ValidateURL {
	init(wrappedValue: URL? = nil, elements: [URLElements] = [.scheme, .host]) {
		self.elements = elements
		self.wrappedValue = ValidateURL.isValid(url: wrappedValue, for: elements) ? wrappedValue : nil
	}
}

extension ValidateURL: Decodable {
	init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		self.init(wrappedValue: try? container.decode(URL.self))
	}
}

private extension ValidateURL {
	static func isValid(url: URL?, for elements: [URLElements]) -> Bool {
		guard let url = url else {
			return false
		}
		var status = true
		elements.forEach {
			if !status {
				return
			}

			switch $0 {
			case .scheme:
				status = url.scheme != nil

			case .host:
				status = url.host != nil
			}
		}
		return status
	}
}
