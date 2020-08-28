//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Foundation

@propertyWrapper
struct LogConsole<Value> {
	var wrappedValue: Value {
		didSet {
			print("*$*\(self)*$*")
		}
	}
}
