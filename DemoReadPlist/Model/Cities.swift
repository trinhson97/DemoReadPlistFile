//
//  Cities.swift
//  DemoReadPlist
//
//  Created by Son on 7/9/18.
//  Copyright © 2018 Son. All rights reserved.
//

import Foundation
class City {
    var cityCode: Int
    var name: String
    init?(dictionary: DICT) {
        guard let cityCode = dictionary["CityCode"] as? Int else {return nil}
        guard let name = dictionary["Name"] as? String else {return nil}
        self.cityCode = cityCode
        self.name = name
    }
}
