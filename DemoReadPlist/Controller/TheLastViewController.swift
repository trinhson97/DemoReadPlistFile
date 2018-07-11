//
//  TheLastViewController.swift
//  DemoReadPlist
//
//  Created by Son on 7/10/18.
//  Copyright © 2018 Son. All rights reserved.
//

import UIKit

class TheLastViewController: UIViewController {
    
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var dictrictsLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let age = UserDefaults.standard.object(forKey: "age") {
            ageLabel.text = "\(age)"
        }
        if let district = UserDefaults.standard.object(forKey: "district") as? String {
            dictrictsLabel.text = district
        }
        if let city = UserDefaults.standard.object(forKey: "city") as? String {
            cityLabel.text = city
        }
        if let gender = UserDefaults.standard.object(forKey: "gender") as? String {
            genderLabel.text = gender
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    

}
