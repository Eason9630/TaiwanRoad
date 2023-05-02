//
//  ViewController.swift
//  TaiwanRoad
//
//  Created by 林祔利 on 2023/5/2.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var selectToolBar: UIToolbar!
    @IBOutlet var selectPickerView: UIPickerView!
    @IBOutlet weak var isHiddenTextField: UITextField!
    @IBOutlet weak var districtLabel: UILabel!
    
    let citys = City.data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        isHiddenTextField.inputView = selectPickerView
        isHiddenTextField.inputAccessoryView = selectToolBar
    }

    @IBAction func selectCancel(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func selectDone(_ sender: Any) {
        let row = selectPickerView.selectedRow(inComponent: 0)
        let districtRow = selectPickerView.selectedRow(inComponent: 1)
        districtLabel.text = citys[row].name + citys[row].districts[districtRow].name
        view.endEditing(true)
    }
    
    @IBAction func selectTap(_ sender: Any) {
        isHiddenTextField.becomeFirstResponder()

    }
    
}

extension ViewController:UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return citys.count
        }else {
            let cityRow = selectPickerView.selectedRow(inComponent: 0)
            return citys[cityRow].districts.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return citys[row].name
        }else {
            let cityRow = selectPickerView.selectedRow(inComponent: 0)
            return citys[cityRow].districts[row].name
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{
            selectPickerView.reloadComponent(1)
            selectPickerView.selectRow(0, inComponent: 1, animated: true)
        }
    }
    
}
