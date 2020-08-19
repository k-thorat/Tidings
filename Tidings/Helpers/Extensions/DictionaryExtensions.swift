//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Foundation

extension Dictionary {
	mutating func merge(dict: [Key: Value]) {
		for (key, value) in dict {
			updateValue(value, forKey: key)
		}
	}
}
