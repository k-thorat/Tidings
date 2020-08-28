//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import SwiftUI

@main
struct TidingsApp: App {
    var body: some Scene {
		WindowGroup {
			TidingsApp.tab()
		}
	}

	static func tab() -> some View {
		TabView {
			kArticle.defaultView()
			kSources.defaultView()
		}
	}
}
