//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Foundation

enum Localized {
	// Event actions
	enum Action: String, Localizable, CaseIterable {
		case okay
	}

	// Alert titles
	enum Error: String, Localizable, CaseIterable {
		case generic = "error_generic"

		// Module strings for Errors
		enum Network: String, Localizable, CaseIterable {
			case generic = "error_network_generic"
			case invalidRequest = "error_network_invalid_request"
			case invalidResponse = "error_network_invalid_response"
			case notConnected = "error_network_not_connected"
		}
	}

	// Loading States
	enum Loading: String, Localizable, CaseIterable {
		case title = "loading_title"
	}

	// Module titles for Tab/Nav
	enum Module: String, Localizable, CaseIterable {
		case articles = "module_articles"
		case sources = "module_sources"
	}
}
