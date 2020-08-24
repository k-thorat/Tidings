//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Combine

extension Publisher where Self.Failure == Never {
	func assignNoRetain<Root>(
		to keyPath: ReferenceWritableKeyPath<Root, Self.Output>, on object: Root
	) -> AnyCancellable where Root: AnyObject {
		sink { [weak object] in
			object?[keyPath: keyPath] = $0
		}
	}
}
