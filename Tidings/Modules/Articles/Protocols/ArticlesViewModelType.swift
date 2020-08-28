//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Combine
import SwiftUI

protocol ArticlesViewModelType: ObservableObject {
	var state: ViewState<[Article]> { get }
	var dataSource: (contents: SafeArray<Article>,
					 placeholders: SafeArray<Article>) { get }

	func send(event: ViewEvent<[Article]>)
}
