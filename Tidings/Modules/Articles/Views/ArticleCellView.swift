//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Foundation
import SwiftUI

struct ArticleCellView: View {
	let article: Article
	//@Environment(\.imageCache) var cache: ImageCache

	var body: some View {
		HStack {
			//thumbnail
			title
		}
	}

	private var title: some View {
		Text(article.title)
			.font(.title)
	}

//	private var thumbnail: some View {
//		KFImage(URL(string: "https://cbsnews1.cbsistatic.com/hub/i/r/2020/08/24/8e9d191d-ac6b-47d1-b314-0db2d661acd3/thumbnail/1200x630/596030a442901921340b6552c52abb9e/kenosha.png")!)
//			.frame(width: 100, height: 100, alignment: .leading)
//	}
}

struct ArticleCellView_Previews: PreviewProvider {
	static var previews: some View {
		/*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
	}
}
