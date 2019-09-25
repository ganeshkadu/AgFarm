

//
//  OtpVC.swift
//  agFarm
//
//  Created by shashikant kadgi on 07/09/19.
//  Copyright © 2019 shashikant kadgi. All rights reserved.
//

import UIKit

class OtpVC: UIViewController {

    //MARK:- IBOutlet Properties
    @IBOutlet weak var tf1: UITextField!
    @IBOutlet weak var tf2: UITextField!
    @IBOutlet weak var tf3: UITextField!
    @IBOutlet weak var tf4: UITextField!
    @IBOutlet weak var tf5: UITextField!
    @IBOutlet weak var tf6: UITextField!
    
    @IBOutlet weak var buttonContinue: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

         setUpView()
    }
    
    @IBAction func textEditDidBegin(_ sender: UITextField) {
        print("textEditDidBegin has been pressed")
        
        if !(sender.text?.isEmpty)!{
            sender.selectAll(self)
            //buttonUnSelected()
        }else{
            print("Empty")
            sender.text = " "
            
        }
        
    }
    @IBAction func textEditChanged(_ sender: UITextField) {
        print("textEditChanged has been pressed")
        let count = sender.text?.count
        //
        if count == 1{
            
            switch sender {
            case tf1:
                tf2.becomeFirstResponder()
            case tf2:
                tf3.becomeFirstResponder()
            case tf3:
                tf4.becomeFirstResponder()
            case tf4:
                tf5.becomeFirstResponder()
            case tf5:
                tf6.becomeFirstResponder()
            case tf6:
                tf6.resignFirstResponder()
            default:
                print("default")
            }
        }
        
    }
    
    //MARK:- Custom Action
    func setUpView(){
        tf1.setBorder()
        tf2.setBorder()
        tf3.setBorder()
        tf4.setBorder()
        tf5.setBorder()
        tf6.setBorder()
        
        tf1.delegate = self
        tf2.delegate = self
        tf3.delegate = self
        tf4.delegate = self
        tf5.delegate = self
        tf6.delegate = self
        
        tf1.becomeFirstResponder()
        
        buttonUnSelected()
    }
    
    func buttonUnSelected(){
        buttonContinue.layer.borderWidth = 1
        buttonContinue.backgroundColor = UIColor.white
        buttonContinue.layer.borderColor = Constant.Color.SavanColor.cgColor
        buttonContinue.setTitleColor(Constant.Color.SavanColor, for: .normal)
        buttonContinue.isUserInteractionEnabled = false
    }
    func checkAllFilled(){
        
        if (tf1.text?.isEmpty)! || (tf2.text?.isEmpty)! || (tf3.text?.isEmpty)! || (tf4.text?.isEmpty)! || (tf5.text?.isEmpty)! || (tf6.text!.isEmpty) {
            
            buttonUnSelected()
            
        }else{
            buttonSelected()
        }
    }
    
    func buttonSelected(){
        buttonContinue.layer.borderWidth = 0
        buttonContinue.backgroundColor = Constant.Color.SavanColor
        buttonContinue.setTitleColor(UIColor.white, for: .normal)
        buttonContinue.isUserInteractionEnabled = true
    }
    @IBAction func btnBackTapped(_ sender: Any) {
        
      

        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnContinueTapped(_ sender: Any) {
        
        if !Connectivity.isConnectedToInternet(){
            showToast(message: AlerMessage.internetConnection)
            return
        }
        gotoRegisterVC()
        
    }
    fileprivate func gotoRegisterVC(){
        
        let obj = storyboard?.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC?
        self.navigationController?.pushViewController(obj!, animated: true)
    }
    
}

extension OtpVC : UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        textField.text = ""
        if textField.text == "" {
            print("Backspace has been pressed")
        }
        
        if string == ""
        {
            print("Backspace was pressed")
            switch textField {
            case tf2:
                tf1.becomeFirstResponder()
            case tf3:
                tf2.becomeFirstResponder()
            case tf4:
                tf3.becomeFirstResponder()
            case tf5:
                tf4.becomeFirstResponder()
            case tf6:
                tf5.becomeFirstResponder()
            default:
                print("default")
            }
            textField.text = ""
            return false
        }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
         textField.text!.trimmingCharacters(in: .whitespaces)
        checkAllFilled()
    }
    
    
}
