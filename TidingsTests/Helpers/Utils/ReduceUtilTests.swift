//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

@testable import Tidings
import XCTest

class ReduceUtilTests: XCTestCase {

	func testReduceOnAppear() {
		XCTAssertEqual(ReduceUtil.reduce(ViewState<String>.error(NetworkError.invalidRequest),
									ViewEvent<String>.onAppear),
					   .error(NetworkError.invalidRequest))

		XCTAssertEqual(ReduceUtil.reduce(ViewState<String>.idle,
									ViewEvent<String>.onAppear),
					   .loading)

		XCTAssertEqual(ReduceUtil.reduce(ViewState<String>.loading,
									ViewEvent<String>.onAppear),
					   .loading)

		XCTAssertEqual(ReduceUtil.reduce(ViewState<String>.loaded(""),
									ViewEvent<String>.onAppear),
					   .loaded(""))
	}

	func testReduceOnLoaded() {
		XCTAssertEqual(ReduceUtil.reduce(ViewState<String>.error(NetworkError.invalidRequest),
									ViewEvent<String>.onLoaded("")),
					   .error(NetworkError.invalidRequest))

		XCTAssertEqual(ReduceUtil.reduce(ViewState<String>.idle,
									ViewEvent<String>.onLoaded("")),
					   .idle)

		XCTAssertEqual(ReduceUtil.reduce(ViewState<String>.loading,
									ViewEvent<String>.onLoaded("")),
					   .loaded(""))

		XCTAssertEqual(ReduceUtil.reduce(ViewState<String>.loaded(""),
									ViewEvent<String>.onLoaded("")),
					   .loaded(""))
	}

	func testReduceOnNext() {
		XCTAssertEqual(ReduceUtil.reduce(ViewState<String>.error(NetworkError.invalidRequest),
									ViewEvent<String>.onNext),
					   .error(NetworkError.invalidRequest))

		XCTAssertEqual(ReduceUtil.reduce(ViewState<String>.idle,
									ViewEvent<String>.onNext),
					   .idle)

		XCTAssertEqual(ReduceUtil.reduce(ViewState<String>.loading,
									ViewEvent<String>.onNext),
					   .loading)

		XCTAssertEqual(ReduceUtil.reduce(ViewState<String>.loaded(""),
									ViewEvent<String>.onNext),
					   .loading)
	}

	func testReduceOnFailed() {
		XCTAssertEqual(ReduceUtil.reduce(ViewState<String>.error(NetworkError.invalidRequest),
									ViewEvent<String>.onFailed(NetworkError.invalidRequest)),
					   .error(NetworkError.invalidRequest))

		XCTAssertEqual(ReduceUtil.reduce(ViewState<String>.idle,
									ViewEvent<String>.onFailed(NetworkError.invalidRequest)),
					   .idle)

		XCTAssertEqual(ReduceUtil.reduce(ViewState<String>.loading,
									ViewEvent<String>.onFailed(NetworkError.invalidRequest)),
					   .error(NetworkError.invalidRequest))

		XCTAssertEqual(ReduceUtil.reduce(ViewState<String>.loaded(""),
									ViewEvent<String>.onFailed(NetworkError.invalidRequest)),
					   .loaded(""))
	}
}
