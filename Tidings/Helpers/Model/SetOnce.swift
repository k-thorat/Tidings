//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Foundation

@propertyWrapper
struct SetOnce<Value> {
	let nullable: Bool

	var wrappedValue: Value? {
		didSet {
			if wrappedValue == nil && nullable {
			} else if oldValue != nil {
				wrappedValue = oldValue
			}
		}
	}

	init(nullable: Bool = false, wrappedValue: Value? = nil) {
		self.nullable = nullable
		self.wrappedValue = wrappedValue
	}
}
