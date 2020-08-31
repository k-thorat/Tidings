//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

@testable import Tidings
import Combine
import XCTest

class PublishersExtensionsTests: XCTestCase {

	class TestPublishers {
		@Published var state: ViewState<String> = .idle
		let input = PassthroughSubject<ViewEvent<String>, Never>()
		private var subscriptions = Set<AnyCancellable>()

		init() {
			Publishers.system(
				initial: state,
				reduce: ReduceUtil.reduce,
				scheduler: ImmediateScheduler.shared,
				feedbacks: [
					Feedback<String, String>.userInput(input: input.eraseToAnyPublisher())
				]
			)
			.assignNoRetain(to: \.state, on: self)
			.store(in: &subscriptions)
		}
	}

	func testRemoveDuplicates() {
		let testExpectation = expectation(description: #function)
		var received: [ViewState<String>] = []
		let test = TestPublishers()

		let stateCancellable = test.$state
			.sink {
				received.append($0)
			}

		let inputCancellable = test.input
			.sink( receiveCompletion: { _ in
				testExpectation.fulfill()
			}, receiveValue: { _ in })

		test.input.send(.onAppear)
		test.input.send(.onAppear)
		test.input.send(.onAppear)
		test.input.send(completion: .finished)

		wait(for: [testExpectation], timeout: 5.0)

		XCTAssertEqual(received.count, 2)
		XCTAssertEqual(received, [.idle ,.loading])

		stateCancellable.cancel()
		inputCancellable.cancel()
	}
}
