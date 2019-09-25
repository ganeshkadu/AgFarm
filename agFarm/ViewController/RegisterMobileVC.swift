//
//  RegisterVC.swift
//  ProjectModelDemo
//
//  Created by shashikant kadgi on 03/09/19.
//  Copyright © 2019 shashikant kadgi. All rights reserved.
//

import UIKit

class RegisterMobileVC : UIViewController {

    
    @IBOutlet weak var txtPhoneNumber: SkyFloatingLabelTextFieldWithIcon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }
   
    @IBAction func btnBackTapped(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnContinueTapped(_ sender: Any) {
        
        let obj = storyboard?.instantiateViewController(withIdentifier: "OtpVC") as! OtpVC
        self.navigationController?.pushViewController(obj, animated: true)
    }
    
}
