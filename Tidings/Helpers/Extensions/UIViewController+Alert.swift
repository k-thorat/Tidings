//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import UIKit

extension UIViewController {
	func showAlert(
		title: String,
		message: String? = nil,
		actions: [UIAlertAction] = [.okay]
	) {
		guard (actions.filter { $0.style == .cancel }).count <= 1 else {
			assertionFailure("AlertView can have only one cancel action.")
			return
		}
		let alertController = UIAlertController(title: title,
												message: message,
												preferredStyle: .alert)

		actions.forEach {
			alertController.addAction($0)
		}

		self.present(alertController,
					 animated: true,
					 completion: nil)
	}
}
