//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Foundation

enum ErrorUtils {
	static func isEqual(_ lhs: Error, _ rhs: Error) -> Bool {
		let error1 = lhs as NSError
		let error2 = rhs as NSError

		return error1.code == error2.code
			&& error1.domain == error2.domain
			&& error1.description == error2.description
	}
}
