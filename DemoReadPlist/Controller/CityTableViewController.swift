//
//  DetailViewController.swift
//  DemoReadPlist
//
//  Created by Son on 2018/06/29.
//  Copyright © 2018 Son. All rights reserved.
//

import UIKit

class CityTableViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataSevice.shared.cities.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = String(describing: DataSevice.shared.cities[indexPath.row].name)

        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        DataSevice.shared.getDataDistricts()
        if let indexPath = tableView.indexPathForSelectedRow {
            let districtsViewController = segue.destination as? DistrictsTableViewController
            districtsViewController?.cityCode = DataSevice.shared.cities[indexPath.row].cityCode
            UserDefaults.standard.set(DataSevice.shared.cities[indexPath.row].name, forKey: "city")
        }
   
    }
    
}
