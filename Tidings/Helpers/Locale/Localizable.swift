//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Foundation

protocol Localizable: RawRepresentable where RawValue == String {
	func value(bundle: Bundle) -> String
}

extension Localizable {
	func value(bundle: Bundle = .main) -> String {
		let value = NSLocalizedString(self.rawValue, bundle: Bundle.main, comment: "")
		if value == self.rawValue {
			assertionFailure("Localized value not found for key: \(self.rawValue)")
		}
		return value
	}
}
