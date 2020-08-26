//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Foundation

//TEST:
@propertyWrapper
struct SetOnce<Value> {
	var wrappedValue: Value? {
		didSet {
			if self.wrappedValue != nil && oldValue != nil {
				self.wrappedValue = oldValue
			}
		}
	}

	init(wrappedValue: Value?) {
		self.wrappedValue = wrappedValue
	}
}
