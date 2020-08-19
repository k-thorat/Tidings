//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import UIKit

extension UIAlertAction {
	static var cancel: UIAlertAction {
		UIAlertAction(title: Localized.Action.okay.value(),
					  style: .cancel,
					  handler: nil)
	}

	static var okay: UIAlertAction {
		UIAlertAction(title: Localized.Action.okay.value(),
					  style: .default,
					  handler: nil)
	}
}
