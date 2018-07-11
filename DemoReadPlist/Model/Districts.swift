//
//  Districts.swift
//  DemoReadPlist
//
//  Created by Son on 2018/06/28.
//  Copyright © 2018 Son. All rights reserved.
//

import Foundation

class Districts {
    var cityCode: Int
    var districts: Int
    var name: String
    init?(dictionery: DICT) {
        guard let cityCode = dictionery["CityCode"] as? Int else { return nil }
        guard let districts = dictionery["DistrictCode"] as? Int else { return nil }
        guard let name = dictionery["Name"] as? String else { return nil }
        self.cityCode = cityCode
        self.districts = districts
        self.name = name 
        
    }
}
