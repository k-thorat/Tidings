//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import SafariServices
import SwiftUI

struct SafariView: UIViewControllerRepresentable {
	let url: URL

	func makeUIViewController(
		context: UIViewControllerRepresentableContext<SafariView>
	) -> SFSafariViewController {
		let configuration = SFSafariViewController.Configuration()
		configuration.barCollapsingEnabled = false
		return SFSafariViewController(url: url, configuration: configuration)
	}

	func updateUIViewController(
		_ uiViewController: SFSafariViewController,
		context: UIViewControllerRepresentableContext<SafariView>
	) {
	}
}

// swiftlint:disable all
struct SafariView_Previews: PreviewProvider {
	static var previews: some View {
		SafariView(url: URL(string: "https://www.apple.com")!)
	}
}
