//
//  Copyright © 2020 Kiran Thorat. All rights reserved.
//

@testable import Tidings
import Foundation

class MockCancelable: Cancelable {
	var wasCancelled: Bool = false
	func cancel() {
		wasCancelled = true
	}
}
