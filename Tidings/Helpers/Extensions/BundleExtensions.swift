//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Foundation

extension Bundle {
	func get<T>(key: Tidings.InfoDictionaryKey) -> T {
		guard let value = infoDictionary?[key.rawValue] as? T else {
			preconditionFailure("\(key.rawValue) can not be nil. Please verify Info.plist")
		}
		return value
	}
}
