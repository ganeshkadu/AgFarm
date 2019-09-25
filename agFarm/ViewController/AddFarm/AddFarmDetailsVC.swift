//
//  FarmDetails.swift
//  agFarm
//
//  Created by shashikant kadgi on 09/09/19.
//  Copyright © 2019 shashikant kadgi. All rights reserved.
//

import UIKit

class AddFarmDetailsVC: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{

    @IBOutlet var addFarmViewModel: AddFarmViewModel!
    @IBOutlet weak var txtCultivationYear: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var txtSeason: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var txtFarmCode: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var txtAddressLine1: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var txtAddressLine2: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var txtCountry: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var txtState: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var txtCounty: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var txtCity: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var txtZipCode: SkyFloatingLabelTextFieldWithIcon!
    
   var postData = [String:Any]()
    var yearsPickerView : UIPickerView!
    var seasonPickerView : UIPickerView!
    var countryPickerView : UIPickerView!
    var statePickerView : UIPickerView!
    var countyPickerView : UIPickerView!
    var cityPickerView : UIPickerView!
    
    var years = ["2017","2018","2019","2020","2021","2022","2023","2024"]
    var seaasons = ["Rabbi","Kharif"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

          self.gotoFarmList()
        
    }
    
    @IBAction func btnBackTapped(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
 
    
    @IBAction func btnSavaTapped(_ sender: Any) {
        
        
        if !Connectivity.isConnectedToInternet(){
            showToast(message: AlerMessage.internetConnection)
            return
        }
        
        if (txtCultivationYear.text?.isEmpty)! {
            
            showAlert(message: Constant.PPHONE_NUMBER)
            
        }
        else if (txtSeason.text?.isEmpty)!
        {
            showAlert(message: Constant.PLEASE_ENTER_PASS)
            
        }
        else if (txtFarmCode.text?.isEmpty)!
        {
            showAlert(message: Constant.PLEASE_ENTER_PASS)
            
        }
        else if (txtAddressLine1.text?.isEmpty)!
        {
            showAlert(message: Constant.PLEASE_ENTER_PASS)
            
        }
        else if (txtAddressLine2.text?.isEmpty)!
        {
            showAlert(message: Constant.PLEASE_ENTER_PASS)
            
        }
        else if (txtCountry.text?.isEmpty)!
        {
            showAlert(message: Constant.PLEASE_ENTER_PASS)
            
        }
        else if (txtState.text?.isEmpty)!
        {
            showAlert(message: Constant.PLEASE_ENTER_PASS)
            
        }
        else if (txtCounty.text?.isEmpty)!
        {
            showAlert(message: Constant.PLEASE_ENTER_PASS)
            
        }
        else if (txtCity.text?.isEmpty)!
        {
            showAlert(message: Constant.PLEASE_ENTER_PASS)
            
        }
        else if (txtZipCode.text?.isEmpty)!
        {
            showAlert(message: Constant.PLEASE_ENTER_PASS)
            
        }
        else
        {
            gotoFarmList()
            
            /*
 
 {"farmerId":"1","cultivationYear":2019,"seaonSubTypeCatId":3,"seaonSubTypeId":2,"addressLine1":"mumbai","addressLine2":"Mumbai","latitude":"19.0937383","longitude":"87.0289480","zipcode":"73678732","villageCatId":3,"villageId":8,"action":"update","farmId":"1"} */
            
            addFarm(postData: ["farmerId":"1","cultivationYear":2019,"seaonSubTypeCatId":3,"seaonSubTypeId":2,"addressLine1":"mumbai","addressLine2":"Mumbai","latitude":"19.0937383","longitude":"87.0289480","zipcode":"73678732","villageCatId":3,"villageId":8,"action":"update","farmId":"1"])
            
        }
        
    }
    
    fileprivate func addFarm(postData:[String:Any]){
        
        if !Connectivity.isConnectedToInternet(){
            showToast(message: AlerMessage.internetConnection)
            return
        }
        showSpinner()
        addFarmViewModel.addFarm(url: Constant.Url.ADD_FARM, postData: postData) { (result) in
            
            print(result)
            self.hideSpinner()
            guard let message = result!["message"] as? String else  { return }
            self.showAlert(message: message)
       //     self.gotoFarmList()
        }
        
        
    }
    
    fileprivate func gotoFarmList(){
        let obj = self.storyboard?.instantiateViewController(withIdentifier: "FarmListVC") as! FarmListVC
        self.navigationController?.pushViewController(obj, animated: true)
    }
    
    // Dropdown
    
    func yearsPickUp(_ textField : UITextField){
        
        
        // UIPickerView
        self.yearsPickerView = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.yearsPickerView.delegate = self
        self.yearsPickerView.dataSource = self
        self.yearsPickerView.backgroundColor = #colorLiteral(red: 0.7166094184, green: 0.8081033826, blue: 0.2471936643, alpha: 1)
        self.yearsPickerView.tintColor = #colorLiteral(red: 0.1976502538, green: 0.4287701845, blue: 0.2695204318, alpha: 1)
        textField.inputView = self.yearsPickerView
        
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
    
    func seasonPickUp(_ textField : UITextField){
        
        
        // UIPickerView
        self.seasonPickerView = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.seasonPickerView.delegate = self
        self.seasonPickerView.dataSource = self
        self.seasonPickerView.backgroundColor = #colorLiteral(red: 0.7166094184, green: 0.8081033826, blue: 0.2471936643, alpha: 1)
        self.seasonPickerView.tintColor = #colorLiteral(red: 0.1976502538, green: 0.4287701845, blue: 0.2695204318, alpha: 1)
        textField.inputView = self.seasonPickerView
        
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
        self.countryPickerView.tintColor = #colorLiteral(red: 0.1976502538, green: 0.4287701845, blue: 0.2695204318, alpha: 1)
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
        self.statePickerView.tintColor = #colorLiteral(red: 0.1976502538, green: 0.4287701845, blue: 0.2695204318, alpha: 1)
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
        self.statePickerView = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.statePickerView.delegate = self
        self.statePickerView.dataSource = self
        self.statePickerView.backgroundColor = #colorLiteral(red: 0.7166094184, green: 0.8081033826, blue: 0.2471936643, alpha: 1)
        self.statePickerView.tintColor = #colorLiteral(red: 0.1976502538, green: 0.4287701845, blue: 0.2695204318, alpha: 1)
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
    //MARK:- PickerView Delegate & DataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        var countrows : Int = years.count
        if pickerView == yearsPickerView {
            countrows = years.count
        }else if pickerView == seasonPickerView{
            countrows = seaasons.count
        }
        
        return countrows
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == yearsPickerView {
            return years[row]
            
        } else if pickerView == seasonPickerView {
            return seaasons[row]
        }
        
        return ""
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == yearsPickerView {
            self.txtCultivationYear.text = years[row]
        } else if pickerView == seasonPickerView {
            self.txtSeason.text = seaasons[row]
        }
        
    }
    //MARK:- TextFiled Delegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == txtCultivationYear {
            self.yearsPickUp(txtCultivationYear)
            return
        }
        if textField == txtSeason {
            self.seasonPickUp(txtSeason)
            return
        }
        
        
    }
    
    //MARK:- Button
    @objc func doneClick() {
        txtCultivationYear.resignFirstResponder()
        txtSeason.resignFirstResponder()
        
    }
    @objc func cancelClick() {
        txtCultivationYear.resignFirstResponder()
        txtSeason.resignFirstResponder()
    }
    
    
}
