//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import SwiftUI

@main
struct TidingsApp: App {
    var body: some Scene {
        WindowGroup {
			TabView {
				ArticleView.tab()
				SourcesView.tab()
			}
        }
	}
}

struct TidingsApp_Previews: PreviewProvider {
	static var previews: some View {
		TabView {
			ArticleView.tab()
			SourcesView.tab()
		}
	}
}
