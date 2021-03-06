//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Combine

struct Throwable<T: Decodable>: Decodable {
	let result: Result<T, Error>

	var value: T? {
		try? result.get()
	}

	init(from decoder: Decoder) throws {
		result = Result { try T(from: decoder) }
	}
}
