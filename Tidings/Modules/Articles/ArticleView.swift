//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import SwiftUI

struct ArticleView: View {
    var body: some View {
		NavigationView {
			List {
				Text(Localized.Module.articles.value())
			}
			.navigationBarTitle(Text(Localized.Module.articles.value()))
		}
    }
}

extension ArticleView {
	static func tab() -> some View {
		ArticleView()
			.tabItem {
				Image(systemName: "phone")
				Text(Localized.Module.articles.value())
			}
	}
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
		ArticleView.tab()
    }
}
