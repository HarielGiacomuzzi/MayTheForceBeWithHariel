//
//  People.swift
//  MayTheForceBeWithHariel
//
//  Created by Hariel Giacomuzzi on 10/07/19.
//  Copyright © 2019 Giacomuzzi. All rights reserved.
//

import Foundation

class People: Codable {

    var name: String
    var height: String
    var mass: String
    var hairColor: String
    var skinColor: String
    var eyeColor: String
    var birthYear: String
    var gender: String

    enum CodingKeys: String, CodingKey {
        case name
        case height
        case mass
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
        case gender
    }
}
