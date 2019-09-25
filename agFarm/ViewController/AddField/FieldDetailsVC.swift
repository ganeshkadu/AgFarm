//
//  FieldDetailsVC.swift
//  agFarm
//
//  Created by shashikant kadgi on 10/09/19.
//  Copyright © 2019 shashikant kadgi. All rights reserved.
//

import UIKit

class FieldDetailsVC: UIViewController {

    @IBOutlet weak var txtCrop: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var txtFieldCode: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var txtVariety: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var txtFieldArea: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var txtLatLong: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var txtLandType: SkyFloatingLabelTextFieldWithIcon!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btnBackTapped(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnSaveTapped(_ sender: Any) {
        
        if !Connectivity.isConnectedToInternet(){
            showToast(message: AlerMessage.internetConnection)
            return
        }
        
        if (txtCrop.text?.isEmpty)! {
            
            showAlert(message: Constant.PPHONE_NUMBER)
            
        }
        else if (txtFieldCode.text?.isEmpty)!
        {
            showAlert(message: Constant.PLEASE_ENTER_PASS)
            
        }
        else if (txtVariety.text?.isEmpty)!
        {
            showAlert(message: Constant.PLEASE_ENTER_PASS)
            
        }
        else if (txtFieldArea.text?.isEmpty)!
        {
            showAlert(message: Constant.PLEASE_ENTER_PASS)
            
        }
        else if (txtLatLong.text?.isEmpty)!
        {
            showAlert(message: Constant.PLEASE_ENTER_PASS)
            
        }
        else if (txtLandType.text?.isEmpty)!
        {
            showAlert(message: Constant.PLEASE_ENTER_PASS)
            
        }
        else
        {
            gotoFarmList()
        }
        
    }
    
    fileprivate func gotoFarmList(){
        let obj = self.storyboard?.instantiateViewController(withIdentifier: "FarmListVC") as! FarmListVC
        self.navigationController?.pushViewController(obj, animated: true)
    }

}
