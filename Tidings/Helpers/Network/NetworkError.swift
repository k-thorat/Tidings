//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Foundation

enum NetworkError: Error {
	case invalidRequest
	case invalidResponse
	case invalidStatusCode
	case notConnected
}
