//
//  StarWarManager.swift
//  API
//
//  Created by Илья Селиванов  on 25.12.2020.
//

import Foundation

class StarWarManager {
    
    static let shared = StarWarManager()
    
    private init(){}
    
    func fetchStarWar(byPage number: Int, closure: (([StarWarResult]?) -> Void)?) {
        RequestHandler(path: "?page=\(number)")
            .response { (model: [StarWarResult]?) in
                closure?(model)
            }
    }
}
