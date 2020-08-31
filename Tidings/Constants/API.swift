//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import UIKit

enum API {
	enum Endpoint: String {
		case headlines = "top-headlines"
		case sources
	}

	enum Query: String {
		case country
		case page
		case pageSize

		enum Country: String {
			case unitedArabEmirates = "ae"
			case argentina = "ar"
			case austria = "at"
			case australia = "au"
			case belgium = "be"
			case bulgaria = "bg"
			case brazil = "br"
			case canada = "ca"
			case switzerland = "ch"
			case china = "cn"
			case columbia = "co"
			case cuba = "cu"
			case czechRepublic = "cz"
			case germany = "de"
			case egypt = "eg"
			case france = "fr"
			case unitedKingdom = "gb"
			case greece = "gr"
			case hongKong = "hk"
			case hungary = "hu"
			case indonesia = "id"
			case ireland = "ie"
			case israel = "il"
			case india = "in"
			case italy = "it"
			case japan = "jp"
			case republicOfKorea = "kr"
			case lithuania = "lt"
			case latvia = "lv"
			case morocco = "ma"
			case mexico = "mx"
			case malaysia = "my"
			case nigeria = "ng"
			case netherlands = "nl"
			case norway = "no"
			case newZealand = "nz"
			case philippines = "ph"
			case poland = "pl"
			case portugal = "pt"
			case romania = "ro"
			case serbia = "rs"
			case russia = "ru"
			case saudiArabia = "sa"
			case sweden = "se"
			case singapore = "sg"
			case slovenia = "si"
			case slovakia = "sk"
			case thailand = "th"
			case turkey = "tr"
			case taiwan = "tw"
			case ukraine = "ua"
			case unitedStates = "us"
			case venezuela = "ve"
			case southAfrica = "za"
		}
	}

	static let authHeader: [String: String] = ["X-Api-Key": "250dd1c633334d448214797fe09e0a8d"]
}
