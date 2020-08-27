//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Foundation
import SwiftUI

enum kArticle {
	static let pageSize = 10
	static let imagePropWidth: CGFloat = 0.30
	static let tabImage = "newspaper"
	static let placeholderImage = "photo"

	static func defaultView(model: ArticlesViewModel = ArticlesViewModel()) -> some View {
		ArticlesView<ArticlesViewModel>(viewModel: model).tab()
	}
}
