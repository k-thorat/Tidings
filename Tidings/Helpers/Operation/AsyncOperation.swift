//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import UIKit

// swiftlint:disable non_localized_word
// swiftlint:disable non_localized_sentence
/// Subclass of `Operation` that add support of asynchronous operations.
/// CRITICAL:
/// You need to call `finish()` after operation is finished.
class AsyncOperation: Operation {
	enum State: String {
		case ready = "Ready"
		case executing = "Executing"
		case finished = "Finished"

		var keyPath: String { "is" + self.rawValue }
	}

	var state: State {
		get {
			stateQueue.sync {
				_state
			}
		}
		set {
			let oldValue = state
			willChangeValue(forKey: state.keyPath)
			willChangeValue(forKey: newValue.keyPath)
			stateQueue.sync(flags: .barrier) {
				_state = newValue
			}
			didChangeValue(forKey: state.keyPath)
			didChangeValue(forKey: oldValue.keyPath)
		}
	}

	private var _state: State = .ready

	private let stateQueue = DispatchQueue(
		label: "\(Bundle.main.bundleIdentifier ?? "BundleIdentifier").AsyncOperation",
		attributes: .concurrent
	)

	override var isAsynchronous: Bool { true }
	override var isExecuting: Bool { state == .executing }
	override var isFinished: Bool {
		if isCancelled && state != .executing {
			return true
		}
		return state == .finished
	}

	override func start() {
		if self.isCancelled {
			state = .finished
		} else {
			state = .ready
			main()
		}
	}

	override func main() {
		if self.isCancelled {
			state = .finished
		} else {
			state = .executing
		}
	}

	override func cancel() {
		finish()
	}

	func finish() {
		if !isFinished {
			state = .finished
		}
	}
}
