//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import SwiftUI

struct SubtitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
			.multilineTextAlignment(.leading)
    }
}

// swiftlint:disable all
struct SubtitleStyle_Previews: PreviewProvider {
    static var previews: some View {
        Text("Subtitle")
            .modifier(SubtitleStyle())
            .previewLayout(.fixed(width: 568, height: 100))
    }
}
