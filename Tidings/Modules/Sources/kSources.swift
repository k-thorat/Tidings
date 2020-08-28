//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Foundation
import SwiftUI

enum kSources {
	static let tabImage = "sun.min"
	static let placeholderSize = 10

	static func defaultView(model: SourcesViewModel = SourcesViewModel()) -> some View {
		SourcesView<SourcesViewModel>(viewModel: model).tab()
	}
}
