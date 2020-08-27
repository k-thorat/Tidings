//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import SwiftUI

struct TitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
			.fixedSize(horizontal: false, vertical: true)
			.multilineTextAlignment(.leading)
    }
}

// swiftlint:disable all
struct TitleStyle_Previews: PreviewProvider {
    static var previews: some View {
        Text("Title")
            .modifier(TitleStyle())
            .previewLayout(.fixed(width: 568, height: 100))
    }
}
