//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Combine
import SwiftUI

enum SourcesService {
	static func get() throws -> AnyPublisher<SourcesResponse, NetworkError> {
		try Service().request(SourcesRequest())
	}
}
