//
//  RegisterVC.swift
//  agFarm
//
//  Created by shashikant kadgi on 06/09/19.
//  Copyright © 2019 shashikant kadgi. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    @IBOutlet weak var dropDown : DropDown!
    
    // The list of array to display. Can be changed dynamically
    
    override func viewDidLoad() {
        super.viewDidLoad()

          dropDown.optionArray = ["Mr", "Ms", "Mrs"]
       
    }
    
    @IBAction func btnBackTapped(_ sender: Any) {
        gotoInputOTPVC()
    }
    @IBAction func btnLoginTapped(_ sender: Any) {
        checkInternetConnection()
        gotoLoginPage()
    }
    @IBAction func btnRegisterTapped(_ sender: Any) {
        checkInternetConnection()
        gotoProfileVC()
    }
    
    fileprivate func gotoInputOTPVC()
    {
        self.navigationController?.popViewController(animated: true)
    }
    fileprivate func gotoLoginPage(){
        
       self.showSpinner()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
            UserDefaults.standard.bool(forKey: Constant.isUserLoggedIn)
            let obj = (UIApplication.shared.delegate) as? AppDelegate
            obj?.gotoLogin() }
    }
    fileprivate func gotoProfileVC(){
        
        let obj = self.storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
        self.navigationController?.pushViewController(obj, animated: true)
        
    }
    fileprivate func checkInternetConnection() {
        
        if !Connectivity.isConnectedToInternet(){
            showToast(message: AlerMessage.internetConnection)
            return
        }
    }
}
