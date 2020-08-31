//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import SwiftUI

extension View {
	func eraseToAnyView() -> AnyView {
		AnyView(self)
	}
}

// MARK: - Debug
extension View {
	func debugPrint(_ value: Any) -> Self {
		debugAction { print(value) }
	}

	func debugBorder(_ color: Color = .red, width: CGFloat = 1) -> some View {
		debugModifier {
			$0.border(color, width: width)
		}
	}

	func debugBackground(_ color: Color = .red) -> some View {
		debugModifier {
			$0.background(color)
		}
	}
}

extension View {
	func debugAction(_ closure: () -> Void) -> Self {
		#if DEBUG
		closure()
		#endif
		return self
	}

	func debugModifier<T: View>(_ modifier: (Self) -> T) -> some View {
		#if DEBUG
		return modifier(self)
		#else
		return self
		#endif
	}
}
