//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

@testable import Tidings
import XCTest

class LocalizedTests: XCTestCase {
	func testLocalized() {
		let languages = UserDefaults.standard.object(forKey: "AppleLanguages") as? [String]

		languages?.forEach{
			let bundle = Bundle.init(path: Bundle.main.path(forResource: $0, ofType: "lproj")!)
			XCTAssert(bundle != nil)
			testActions(bundle: bundle!)
			testError(bundle: bundle!)
			testLoading(bundle: bundle!)
			testModule(bundle: bundle!)
		}
	}

	private func validate<T: RawRepresentable>(key: T, bundle: Bundle) where T.RawValue == String {
		XCTAssertNotNil(NSLocalizedString(key.rawValue,
										  tableName: nil,
										  bundle: bundle,
										  value: "",
										  comment: ""))
	}

	private func testActions(bundle: Bundle) {
		Localized.Action.allCases.forEach {
			validate(key: $0, bundle: bundle)
		}
	}

	private func testError(bundle: Bundle) {
		Localized.Error.allCases.forEach {
			validate(key: $0, bundle: bundle)
		}

		Localized.Error.Network.allCases.forEach {
			validate(key: $0, bundle: bundle)
		}
	}

	private func testLoading(bundle: Bundle) {
		Localized.Loading.allCases.forEach {
			validate(key: $0, bundle: bundle)
		}
	}

	private func testModule(bundle: Bundle) {
		Localized.Module.allCases.forEach {
			validate(key: $0, bundle: bundle)
		}
	}
}

