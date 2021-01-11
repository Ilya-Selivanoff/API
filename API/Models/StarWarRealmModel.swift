//
//  StarWarRealmModel.swift
//  API
//
//  Created by Илья Селиванов  on 09.01.2021.
//

import Foundation
import RealmSwift

class StarWarRealmModel: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var height: String = ""
    @objc dynamic var mass: String = ""
    @objc dynamic var hairColor: String = ""
    @objc dynamic var skinColor: String = ""
    @objc dynamic var eyeColor: String = ""
    @objc dynamic var birthYear: String = ""
    @objc dynamic var gender: String = ""
    @objc dynamic var homeworld: String = ""
    @objc dynamic var created: String = ""
    @objc dynamic var edited: String = ""
    @objc dynamic var url: String = ""
    
    @objc open override class func primaryKey() -> String? {
        return "name"
    }
}
