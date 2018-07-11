//
//  DataSevice.swift
//  DemoReadPlist
//
//  Created by Son on 2018/06/28.
//  Copyright © 2018 Son. All rights reserved.
//

import Foundation

typealias DICT = Dictionary<AnyHashable,Any>

class DataSevice {
    static var shared: DataSevice = DataSevice()
    private var _districts: [Districts]?
    private var _city: [City]?
    var districts : [Districts] {
        get {
            if _districts == nil {
                getDataDistricts()
                
            }
            return _districts ?? []
        }
        set {
            _districts = newValue
        }
    }
    
    var cities: [City] {
        get {
            if _city == nil{
                getDataCity()
            }
            return _city ?? []
        }
        set {
            _city = newValue
        }
    }
    
    func getDataDistricts() {
        _districts = []
        
        guard let dictionary = loadDataFrom(plist: "Districts", type: "plist") else { return }
        guard let dictionaryDatas = dictionary["Districts"] as? [DICT] else { return }
        for dataDistrict in dictionaryDatas {
            if let district = Districts(dictionery: dataDistrict){
                _districts?.append(district)
            }
        }
    }
    func getDataCity() {
        _city = []
        guard let city = loadDataFrom(plist: "Cities", type: "plist") else { return }
        guard let cityDatas = city["Cities"] as? [DICT] else {return}
        for dataCity in cityDatas {
            if let city = City(dictionary: dataCity){
                _city?.append(city)
            }
            
        }
      
    }

    func loadDataFrom(plist resource: String, type: String) -> DICT? {
        var result: DICT?
//        --->
        guard let filePath = Bundle.main.path(forResource: resource, ofType: type) else { return nil}
// test data "y/no"
        guard FileManager.default.fileExists(atPath: filePath) else {return nil}
// get contents
        guard let data  = FileManager.default.contents(atPath: filePath) else { return nil}
        
        do {
//            giai nen
            let object = try PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil)
//        Any -->
            result = object as? DICT
            
        } catch {
            print(error.localizedDescription)
        }
        
        return result
    }
//    fillter data in plist
    func fillterDistrict(with cityCode: Int) -> [Districts] {
// ?? = unward
        return _districts?.filter { $0.cityCode == cityCode } ?? []
        

    }
}
