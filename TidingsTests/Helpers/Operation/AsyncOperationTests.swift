//
//  Copyright © 2020 Kiran Thorat. All rights reserved.
//

@testable import Movies
import XCTest

class AsyncOperationTests: XCTestCase {
	let queue = OperationQueue()
	override func tearDown() {
		super.tearDown()
		queue.cancelAllOperations()
	}

	func testOperationLifeCycle() {
		let operation = AsyncOperation()
		queue.addOperation(operation)

		let opExpectation = expectation(description: #function)
		DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
			operation.finish()
			opExpectation.fulfill()
		}

		wait(for: [opExpectation], timeout: 2)

		XCTAssertFalse(operation.isExecuting)
		XCTAssertTrue(queue.operationCount == 0)
	}

	func testCancelledOperationLifeCycle() {
		let operation = AsyncOperation()
		queue.addOperation(operation)

		let opExpectation = expectation(description: #function)

		DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
			XCTAssertTrue(operation.isExecuting)
			self.queue.cancelAllOperations()
			opExpectation.fulfill()
		}

		wait(for: [opExpectation], timeout: 2)

		XCTAssertFalse(operation.isExecuting)
		XCTAssertTrue(queue.operationCount == 0)
	}
}
