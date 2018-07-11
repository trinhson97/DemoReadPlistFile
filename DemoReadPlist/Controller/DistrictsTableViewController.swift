//
//  TableViewController.swift
//  DemoReadPlist
//
//  Created by Son on 2018/06/28.
//  Copyright © 2018 Son. All rights reserved.
//

import UIKit

class DistrictsTableViewController: UITableViewController {
    var cityCode : Int!
    
    var districs: [Districts] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        if cityCode != nil {
            districs = DataSevice.shared.fillterDistrict(with: cityCode)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return districs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = districs[indexPath.row].name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserDefaults.standard.set(DataSevice.shared.districts[indexPath.row].name, forKey: "district")
    }
  
}
