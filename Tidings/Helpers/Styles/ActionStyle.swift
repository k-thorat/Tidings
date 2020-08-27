//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import SwiftUI

struct ActionStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .font(.callout)
            .multilineTextAlignment(.center)
    }
}

// swiftlint:disable all
struct ActionStyle_Previews: PreviewProvider {
    static var previews: some View {
        Text("Button")
            .modifier(ActionStyle())
            .previewLayout(.fixed(width: 568, height: 100))
    }
}
