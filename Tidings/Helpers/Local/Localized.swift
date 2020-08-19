//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Foundation

enum Localized {
	// Event actions
	enum Action: String, Localizable {
		case okay
	}

	// Alert titles
	enum Alert: String, Localizable {
		case genericError
	}

	// Module titles for Tab/Nav
	enum Module: String, Localizable {
		case articles = "module.articles"
		case sources = "module.sources"
	}
}
