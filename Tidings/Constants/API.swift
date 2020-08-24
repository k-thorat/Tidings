//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import UIKit

enum API {
	enum Endpoint: String {
		case headlines = "top-headlines"
	}

	enum Query: String {
		case country
		case page
		case pageSize
	}

	static let authHeader: [String: String] = ["X-Api-Key": "250dd1c633334d448214797fe09e0a8d"]
}
