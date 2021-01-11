//
//  StarWarResult.swift
//  API
//
//  Created by Илья Селиванов  on 09.01.2021.
//

import Foundation

struct StarWarResult {
    var name: String?
    var height: String?
    var mass: String?
    var hairColor: String?
    var skinColor: String?
    var eyeColor: String?
    var birthYear: String?
    var gender: String?
    var homeworld: String?
    var created: String?
    var edited: String?
    var url: String?
    
    init(realmModel: StarWarRealmModel) {
        self.name = realmModel.name
        self.height = realmModel.height
        self.mass = realmModel.mass

        self.hairColor = realmModel.hairColor
        self.skinColor = realmModel.skinColor
        self.eyeColor = realmModel.eyeColor
        self.birthYear = realmModel.birthYear
        self.gender = realmModel.gender
        self.homeworld = realmModel.homeworld
        self.created = realmModel.created
        self.edited = realmModel.edited
        self.url = realmModel.url
    }
}

extension StarWarResult: Codable {
    enum CodingKeys: String, CodingKey {
        case name, height, mass
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
        case gender, homeworld
        case created, edited, url
    }
}
