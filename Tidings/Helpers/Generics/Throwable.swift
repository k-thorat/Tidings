//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Combine

enum Throwable<T: Decodable>: Decodable {
	case success(T)
	case failure(Error)

	init(from decoder: Decoder) throws {
		do {
			let decoded = try T(from: decoder)
			self = .success(decoded)
		} catch {
			self = .failure(error)
		}
	}
}

extension Throwable {
	var value: T? {
		switch self {
		case .failure:
			return nil

		case .success(let value):
			return value
		}
	}
}
