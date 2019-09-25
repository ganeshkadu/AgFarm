//
//  ProfileVC.swift
//  agFarm
//
//  Created by shashikant kadgi on 06/09/19.
//  Copyright © 2019 shashikant kadgi. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    
    @IBOutlet weak var btnMaleOutlet: UIButton!
    
    var datePicker : UIDatePicker!
    var countryPickerView : UIPickerView!
    var statePickerView : UIPickerView!
    var countyPickerView : UIPickerView!
    
    var country = ["USA","India"]
    var state = ["state - 1" , "state - 2" , "state - 3" , "state - 4","state - 5","state - 6","state - 7"]
    var county = ["county - 1","county - 2","county - 3","county - 4","county - 5","county - 6","county - 7","county - 8"]
    
    @IBOutlet weak var txtDateOfBirth: SkyFloatingLabelTextFieldWithIcon! {
        
        didSet{
            
            let image = UIImage(named: "dropdown")
            let button = UIButton(type: .custom)
            button.frame = CGRect(x:0, y:0, width: 20, height: 20)
            
            let tintedImage = image!.withRenderingMode(.alwaysTemplate)
            button.setImage(tintedImage, for: .normal)
            
            button.setTitleColor(UIColor.clear, for: .normal)
            button.addTarget(self, action: #selector(dateOfBirthBtnClicked), for: UIControl.Event.touchDown)
            button.isUserInteractionEnabled = true
            self.txtDateOfBirth.rightViewMode = .always
            self.txtDateOfBirth.rightView = button
           
        }
    }
    
    @IBOutlet weak var txtCountry: SkyFloatingLabelTextFieldWithIcon!
    
    @IBOutlet weak var txtState: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var txtCounty: SkyFloatingLabelTextFieldWithIcon!
    
    lazy var btnCountry: UIButton = {
    
        let button = UIButton(type: .custom)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
      
        txtDateOfBirth.delegate = self
      
    }
    
    @objc func dateOfBirthBtnClicked() {
    
        self.txtDateOfBirth.becomeFirstResponder()
        self.pickUpDate(self.txtDateOfBirth)
    }
    
    // MARK: - TextField Delegate
    //MARK:- textFiled Delegate
   
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        if textField == self.txtCountry {
            
            return range.location < 15
            
        }
        
        if textField == self.txtDateOfBirth {
            return range.location <= 10
        }
        
        return true
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func btnBackTapped(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnSaveTapped(_ sender: Any) {
        
        let obj = self.storyboard?.instantiateViewController(withIdentifier: "AddFarmDetailsVC") as! AddFarmDetailsVC
        self.navigationController?.pushViewController(obj, animated: true)
    }
    //MARK:- Function of datePicker
    func pickUpDate(_ textField : UITextField){
        
        // DatePicker
        self.datePicker = UIDatePicker(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.datePicker.backgroundColor = #colorLiteral(red: 0.7166094184, green: 0.8081033826, blue: 0.2471936643, alpha: 1)
        self.datePicker.datePickerMode = UIDatePicker.Mode.date
        textField.inputView = self.datePicker
        
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
        
    }
    
    
    func countryPickUp(_ textField : UITextField){
        
        
        // UIPickerView
        self.countryPickerView = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.countryPickerView.delegate = self
        self.countryPickerView.dataSource = self
        self.countryPickerView.backgroundColor = #colorLiteral(red: 0.7166094184, green: 0.8081033826, blue: 0.2471936643, alpha: 1)
        textField.inputView = self.countryPickerView
        
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
        
    }
    func statePickUp(_ textField : UITextField){
        
        
        // UIPickerView
        self.statePickerView = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.statePickerView.delegate = self
        self.statePickerView.dataSource = self
        self.statePickerView.backgroundColor = #colorLiteral(red: 0.7166094184, green: 0.8081033826, blue: 0.2471936643, alpha: 1)
        textField.inputView = self.statePickerView
        
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
        
    }
    func countyPickUp(_ textField : UITextField){
        
        
        // UIPickerView
        self.countyPickerView = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.countyPickerView.delegate = self
        self.countyPickerView.dataSource = self
        self.countyPickerView.backgroundColor = #colorLiteral(red: 0.7166094184, green: 0.8081033826, blue: 0.2471936643, alpha: 1)
        textField.inputView = self.countyPickerView
        
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
        
    }
    //MARK:- PickerView Delegate & DataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        var countrows : Int = country.count
        if pickerView == countryPickerView {
            countrows = country.count
        }else if pickerView == statePickerView{
            countrows = state.count
        }else if pickerView == countyPickerView{
            countrows = county.count
        }
        
        return countrows
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == countryPickerView {
            return country[row]
            
        } else if pickerView == statePickerView {
            return state[row]
        }else if pickerView == countyPickerView {
            return county[row]
        }
        
        return ""
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == countryPickerView {
            self.txtCountry.text = country[row]
        } else if pickerView == statePickerView {
            self.txtState.text = state[row]
        } else if pickerView == countyPickerView {
            self.txtCounty.text = county[row]
        }
        
    }
    //MARK:- TextFiled Delegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        

        if textField == self.txtDateOfBirth {
            
             self.pickUpDate(self.txtDateOfBirth)
            
            return
        }
        if textField == self.txtCountry {
            
            self.countryPickUp(self.txtCountry)
            
            return
        }
        if textField == self.txtState {
            
            self.statePickUp(self.txtState)
            
            return
        }
        if textField == self.txtCounty {
            
            self.countyPickUp(self.txtCounty)
            
            return
        }
        
    }
    
    //MARK:- Button
    @objc func doneClick() {
        let dateFormatter1 = DateFormatter()
        //   dateFormatter1.dateFormat = "MM/dd/yy"
        dateFormatter1.dateStyle = .medium
        dateFormatter1.timeStyle = .none
        
        if txtDateOfBirth.isFirstResponder {
            
            txtDateOfBirth.text = dateFormatter1.string(from: datePicker.date)
            txtDateOfBirth.resignFirstResponder()
            
        }
       
        txtCountry.resignFirstResponder()
        txtState.resignFirstResponder()
        txtCounty.resignFirstResponder()
    }
    @objc func cancelClick() {
        txtDateOfBirth.resignFirstResponder()
        txtCountry.resignFirstResponder()
        txtState.resignFirstResponder()
        txtCounty.resignFirstResponder()
    }
    
    
}
