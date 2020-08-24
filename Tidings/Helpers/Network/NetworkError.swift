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
	case other(Error)

	static func map(_ error: Error) -> NetworkError {
		(error as? NetworkError) ?? .other(error)
	}
}

extension NetworkError: LocalizedError {
	var errorDescription: String? {
		switch self {
		case .invalidRequest:
			return Localized.Error.Network.invalidRequest.value()

		case .invalidResponse:
			return Localized.Error.Network.invalidResponse.value()

		case .invalidStatusCode:
			return Localized.Error.Network.generic.value()

		case .notConnected:
			return Localized.Error.Network.notConnected.value()

		case .other(let error):
			return error.localizedDescription
		}
	}
}
