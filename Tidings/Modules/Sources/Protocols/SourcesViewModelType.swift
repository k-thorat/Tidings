//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Combine
import SwiftUI

protocol SourcesViewModelType: ObservableObject {
	var state: ViewState<[Source]> { get }
	var dataSource: SafeArray<Source> { get }
	var placeholders: [Source] { get }

	func send(event: ViewEvent<[Source]>)
}
