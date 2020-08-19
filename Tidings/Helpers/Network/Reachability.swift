//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import SystemConfiguration
import UIKit

enum Reachability {
	enum Status {
		case notReachable
		case reachableViaWWAN
		case reachableViaWiFi
	}

	static func status() -> Status {
		var zeroAddress = sockaddr_in()
		zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
		zeroAddress.sin_family = sa_family_t(AF_INET)

		let reachabilityRoute = withUnsafePointer(to: &zeroAddress) {
			$0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
				SCNetworkReachabilityCreateWithAddress(nil, $0)
			}
		}

		guard let defaultReachability = reachabilityRoute else {
			return .notReachable
		}

		var flags: SCNetworkReachabilityFlags = []
		if !SCNetworkReachabilityGetFlags(defaultReachability, &flags) {
			return .notReachable
		}

		if !flags.contains(.reachable) {
			return .notReachable
		} else if flags.contains(.isWWAN) {
			return .reachableViaWWAN
		} else if !flags.contains(.connectionRequired) {
			return .reachableViaWiFi
		} else if (flags.contains(.connectionOnDemand)
			|| flags.contains(.connectionOnTraffic))
			&& !flags.contains(.interventionRequired) {
			return .reachableViaWiFi
		}

		return .notReachable
	}
}
