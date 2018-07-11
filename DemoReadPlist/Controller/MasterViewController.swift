//
//  MasterViewController.swift
//  DemoReadPlist
//
//  Created by Son on 2018/06/29.
//  Copyright © 2018 Son. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    @IBOutlet var radioButton: [UIButton]!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var pickerData = Array(1...100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        Connect data
        pickerView.delegate = self
        pickerView.dataSource = self
        
        self.pickerView.selectRow(17, inComponent: 0, animated: true)
       
    }
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
//    The number compontents
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

//    The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(pickerData[row]) 
    }
    @IBAction func buttonClicked(_ sender: UIButton) {
//        forEach = trả về phần từ đầu tiên của chuỗi
        radioButton.forEach{ (button) in
            button.isSelected = false
            
        }
        sender.isSelected = true
        print(sender.currentTitle ?? "")
        if sender.isSelected == true {
            UserDefaults.standard.set("\(sender.currentTitle!)", forKey: "gender")
        }
    }
    @IBAction func LogInTap(_sender: UIButton){
        let selectedAge = pickerData[pickerView.selectedRow(inComponent: (0))]
        UserDefaults.standard.set(selectedAge, forKey: "age")
    }
    
    


}
