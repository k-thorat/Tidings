//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import SwiftUI

struct SourcesView: View {
    var body: some View {
		NavigationView {
			List {
				Text(Localized.Module.sources.value())
			}
			.navigationBarTitle(Text(Localized.Module.sources.value()))
		}
    }
}

extension SourcesView {
	static func tab() -> some View {
		SourcesView()
			.tabItem {
				Image(systemName: "phone")
				Text(Localized.Module.sources.value())
			}
	}
}

struct SourcesView_Previews: PreviewProvider {
    static var previews: some View {
		SourcesView()
    }
}
