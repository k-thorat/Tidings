//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Foundation
import KingfisherSwiftUI
import SwiftUI

struct SourceCellView: View {
	let source: Source
	private let viewPadding: CGFloat = 10.0

	var body: some View {
		VStack(alignment: .leading) {
			title
				.padding(.bottom, viewPadding / 2)
			subtitle
		}.padding(viewPadding)
	}

	private var title: some View {
		Text(source.title)
			.lineLimit(1)
			.modifier(TitleStyle())
	}

	private var subtitle: some View {
		Text(source.subtitle)
			.lineLimit(2)
			.modifier(SubtitleStyle())
	}
}

// swiftlint:disable all
struct SourceCellView_Previews: PreviewProvider {
	static var previews: some View {
		let source = Source.placeholders(1)
		List(source) {
			SourceCellView(source: $0)
		}
	}
}
