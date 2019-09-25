//
//  LoginVC.swift
//  ProjectModelDemo
//
//  Created by shashikant kadgi on 03/09/19.
//  Copyright © 2019 shashikant kadgi. All rights reserved.
//

import UIKit

class LoginVC: UIViewController ,UITextFieldDelegate {
    
    @IBOutlet var loginModel: LoginViewModel!
    @IBOutlet weak var txtPassword: SkyFloatingLabelTextFieldWithIcon!{
        didSet{
            txtPassword.tintColor = .darkGray
            txtPassword.isSecureTextEntry = true
           
        }
    }
    
    @IBOutlet weak var txtPhoneNumber: SkyFloatingLabelTextFieldWithIcon!
    
    var postData = [String:Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        txtPhoneNumber.text = "8905987899"
        txtPassword.text = "12345"
       self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func btnContinueTapped(_ sender: Any) {
        
        if !Connectivity.isConnectedToInternet(){
            showToast(message: AlerMessage.internetConnection)
            return
        }
        
        // Check UserName is empty or not
        if (txtPhoneNumber.text?.isEmpty)! {
            
            showAlert(message: Constant.PPHONE_NUMBER)
        
        }
            // check Password is empty or not
        else if (txtPassword.text?.isEmpty)!
        {
            showAlert(message: Constant.PLEASE_ENTER_PASS)
           
        }
        else
        {
            showSpinner()
            
//            loginModel.fetchReferenceData { (data) in
//
//                print(data)
//            }
            loginModel.secreatData(username: txtPhoneNumber.text!){
                let error = self.loginModel.getErrorMessage()
                if !( error != nil) {
                DispatchQueue.main.async(execute: {
                
                    let secreatD = self.loginModel.getArraySecrete() as? NSDictionary
                    let pass = "\(self.txtPassword.text!)\((secreatD!.value(forKey: "salt") as! String))"
                    self.loginModel.authenticateData(username: self.txtPhoneNumber.text!, password:pass.sha256!) {
                        DispatchQueue.main.async(execute: {
                          self.hideSpinner()
                            let loginData = self.loginModel.getArray() as NSDictionary
//                            let obj = (UIApplication.shared.delegate) as! AppDelegate
//                            obj.gotoSatelliteView()
                               self.gotoSatelliteView()
                            
                        })
                    }
                })
            }
            else {
                    self.showToast(message: error!)
                    self.hideSpinner()
                }
          }
        }
       
    }
    
    @IBAction func btnForgotPassword(_ sender: Any) {
        
    }
    
    @IBAction func btnSignUpTapped(_ sender: Any) {
        
        self.showAlert(title: "agFarm Server", message: "Contact to Admin.")
        //gotoSignUp()
    }
    
    fileprivate func gotoSignUp() {
    
        let obj = storyboard?.instantiateViewController(withIdentifier: "RegisterMobileVC") as! RegisterMobileVC?
        self.navigationController?.pushViewController(obj!, animated: true)
    }
    fileprivate func gotoSatelliteView() {
        
        let obj = storyboard?.instantiateViewController(withIdentifier: "SatelliteVC") as! SatelliteVC?
        self.navigationController?.pushViewController(obj!, animated: true)
    }
    // MARK: - TextField Delegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        if textField == self.txtPassword {
            
            return range.location < 15
            
        }
        
        if textField == self.txtPhoneNumber {
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
    
}
