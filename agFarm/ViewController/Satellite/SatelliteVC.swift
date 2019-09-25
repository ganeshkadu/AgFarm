//
//  SatelliteVC.swift
//  agFarm
//
//  Created by shashikant kadgi on 11/09/19.
//  Copyright © 2019 shashikant kadgi. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps

class SatelliteVC: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{
//    @IBOutlet weak var txtSeason: UITextField!
//    @IBOutlet weak var txtFarm: UITextField!
//    @IBOutlet weak var txtField: UITextField!
//    @IBOutlet weak var txtYear: UITextField!
    var myPickerView : UIPickerView!
    var seasonPickerView : UIPickerView!
    var farmsPickerView : UIPickerView!
    var fieldPickerView : UIPickerView!
    
    var years = ["2017","2018","2019","2020","2021","2022","2023","2024"]
    var seaasons = ["Rabbi","Kharif"]
    var farms = ["Farmr - 1" , "Farmr - 2" , "Farmr - 3" , "Farmr - 4","Farmr - 5","Farmr - 6","Farmr - 7"]
    var fields = ["Field - 1","Field - 2","Field - 3","Field - 4","Field - 5","Field - 6","Field - 7","Field - 8"]
    
    var listOFPlotID  = [String]()
    // bottom Animaation view
    
    
    @IBOutlet weak var txtYear: DropDown!
    @IBOutlet weak var txtSeason: DropDown!
    @IBOutlet weak var txtFarm: DropDown!
    @IBOutlet weak var txtField: DropDown!
    
    @IBOutlet weak var txtDate: DropDown!
    @IBOutlet weak var txtBrightness: DropDown!
   
    enum CardState {
        case expanded
        case collapsed
    }
    
    var cardViewController:CardViewController!
    var visualEffectView:UIVisualEffectView!
    
    let cardHeight:CGFloat = 420
    let cardHandleAreaHeight:CGFloat = 65
    
    var cardVisible = false
    var nextState:CardState {
        return cardVisible ? .collapsed : .expanded
    }
    
    var runningAnimations = [UIViewPropertyAnimator]()
    var animationProgressWhenInterrupted:CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        txtBrightness.optionArray = ["Vegetation","Moisture","Brightness"]
        txtYear.optionArray = ["2015","2016","2017","2018","2019"]
        txtSeason.optionArray =  ["Rabbi","Kharif"]
        txtFarm.optionArray = ["Farm-1" , "Farm-2" , "Farm-3" , "Farm-4", "Farm-5", "Farm-6"]
//        txtField.optionArray = ["Fiel-1","Field-2","Field-3","Field-4","Field-5","Field-6","Field-7","Field-8"]
        
        for index in 126..<1742 {
            
            txtField.optionArray.append("Ag_C004_\(index)")
           // listOFPlotID.append("Ag_C004_\(index)")
        }
        //setupCard()
        print(listOFPlotID)
        
        txtField.didSelect{(selectedText , index , id) in
           // self.txtPlotID.text = "Selected String: \(selectedText) \n index: \(index) \n Id: \(id)"
            self.txtField.text = selectedText
            
            print("selected Text = \(selectedText)")
        }
        
    }
    
    fileprivate func initializeGoogleMap(){
        
        let camera = GMSCameraPosition.camera(withLatitude: 36.1254, longitude: -89.6837 , zoom: 16.0)
        let mapView = GMSMapView.map(withFrame: self.view.bounds, camera: camera)
        mapView.mapType = .satellite
        mapView.settings.compassButton = true
        mapView.settings.myLocationButton = true
        mapView.settings.zoomGestures = true
        mapView.setMinZoom(10.0, maxZoom: 18.0)
        mapView.settings.indoorPicker = true
        view = mapView
    }
    @IBAction func btnBackTapped(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func btnProfileTapped(_ sender: Any) {
        
        let obj = self.storyboard?.instantiateViewController(withIdentifier: "ProfileContainerVC") as! ProfileContainerVC
        self.navigationController?.pushViewController(obj, animated: true)
        
    }
    func yearsPickUp(_ textField : UITextField){
        
       
        // UIPickerView
        self.myPickerView = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.myPickerView.delegate = self
        self.myPickerView.dataSource = self
        self.myPickerView.backgroundColor = #colorLiteral(red: 0.7166094184, green: 0.8081033826, blue: 0.2471936643, alpha: 1)
        self.myPickerView.tintColor = #colorLiteral(red: 0.1976502538, green: 0.4287701845, blue: 0.2695204318, alpha: 1)
        textField.inputView = self.myPickerView
        
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
    func farmPickUp(_ textField : UITextField){
        
        
        // UIPickerView
        self.farmsPickerView = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.farmsPickerView.delegate = self
        self.farmsPickerView.dataSource = self
        self.farmsPickerView.backgroundColor = #colorLiteral(red: 0.7166094184, green: 0.8081033826, blue: 0.2471936643, alpha: 1)
        textField.inputView = self.farmsPickerView
        
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
    func fieldPickUp(_ textField : UITextField){
        
        
        // UIPickerView
        self.fieldPickerView = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.fieldPickerView.delegate = self
        self.fieldPickerView.dataSource = self
        self.fieldPickerView.backgroundColor = #colorLiteral(red: 0.7166094184, green: 0.8081033826, blue: 0.2471936643, alpha: 1)
        textField.inputView = self.fieldPickerView
        
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
        if pickerView == myPickerView {
            countrows = years.count
        }else if pickerView == seasonPickerView{
            countrows = seaasons.count
        }else if pickerView == farmsPickerView{
            countrows = farms.count
        }else if pickerView == fieldPickerView{
            countrows = fields.count
        }
        
        return countrows
     }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == myPickerView {
           return years[row]
            
        } else if pickerView == seasonPickerView {
          return seaasons[row]
        }else if pickerView == farmsPickerView {
           return farms[row]
        }else if pickerView == fieldPickerView {
           return fields[row]
        }
        
        return ""
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == myPickerView {
            self.txtYear.text = years[row]
        } else if pickerView == seasonPickerView {
            self.txtSeason.text = seaasons[row]
        } else if pickerView == farmsPickerView {
            self.txtFarm.text = farms[row]
        } else if pickerView == fieldPickerView {
            self.txtField.text = fields[row]
        }

    }
    //MARK:- TextFiled Delegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
//        if textField == txtYear {
//              self.yearsPickUp(txtYear)
//            return
//        }
//        if textField == txtSeason {
//            self.seasonPickUp(txtSeason)
//            return
//        }
//        if textField == txtFarm {
//            self.farmPickUp(txtFarm)
//            return
//        }
//        if textField == txtField {
//            self.fieldPickUp(txtField)
//            return
//        }
      
    }
    
    //MARK:- Button
    @objc func doneClick() {
         txtYear.resignFirstResponder()
         txtSeason.resignFirstResponder()
         txtFarm.resignFirstResponder()
         txtField.resignFirstResponder()
    }
    @objc func cancelClick() {
        txtYear.resignFirstResponder()
        txtSeason.resignFirstResponder()
        txtFarm.resignFirstResponder()
        txtField.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // bottom animation view
    
    func setupCard() {
        visualEffectView = UIVisualEffectView()
        visualEffectView.frame = self.view.frame
        //self.view.addSubview(visualEffectView)
        
        cardViewController = CardViewController(nibName:"CardViewController", bundle:nil)
        self.addChild(cardViewController)
        self.view.addSubview(cardViewController.view)
        
        cardViewController.view.frame = CGRect(x: 0, y: self.view.frame.height - cardHandleAreaHeight, width: self.view.bounds.width, height: cardHeight)
        
        cardViewController.view.clipsToBounds = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleCardTap(recognzier:)))
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(self.handleCardPan(recognizer:)))
        
        cardViewController.handleArea.addGestureRecognizer(tapGestureRecognizer)
        cardViewController.handleArea.addGestureRecognizer(panGestureRecognizer)
        
        
    }
    
    @objc
    func handleCardTap(recognzier:UITapGestureRecognizer) {
        switch recognzier.state {
        case .ended:
            animateTransitionIfNeeded(state: nextState, duration: 0.9)
        default:
            break
        }
    }
    
    @objc
    func handleCardPan (recognizer:UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            startInteractiveTransition(state: nextState, duration: 0.9)
        case .changed:
            let translation = recognizer.translation(in: self.cardViewController.handleArea)
            var fractionComplete = translation.y / cardHeight
            fractionComplete = cardVisible ? fractionComplete : -fractionComplete
            updateInteractiveTransition(fractionCompleted: fractionComplete)
        case .ended:
            continueInteractiveTransition()
        default:
            break
        }
        
    }
    
    func animateTransitionIfNeeded (state:CardState, duration:TimeInterval) {
        if runningAnimations.isEmpty {
            let frameAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1) {
                switch state {
                case .expanded:
                    self.cardViewController.view.frame.origin.y = self.view.frame.height - self.cardHeight
                case .collapsed:
                    self.cardViewController.view.frame.origin.y = self.view.frame.height - self.cardHandleAreaHeight
                }
            }
            
            frameAnimator.addCompletion { _ in
                self.cardVisible = !self.cardVisible
                self.runningAnimations.removeAll()
            }
            
            frameAnimator.startAnimation()
            runningAnimations.append(frameAnimator)
            
            
            let cornerRadiusAnimator = UIViewPropertyAnimator(duration: duration, curve: .linear) {
                switch state {
                case .expanded:
                    self.cardViewController.view.layer.cornerRadius = 12
                case .collapsed:
                    self.cardViewController.view.layer.cornerRadius = 0
                }
            }
            
            cornerRadiusAnimator.startAnimation()
            runningAnimations.append(cornerRadiusAnimator)
            
            let blurAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1) {
                switch state {
                case .expanded:
                    self.visualEffectView.effect = UIBlurEffect(style: .dark)
                case .collapsed:
                    self.visualEffectView.effect = nil
                }
            }
            
            blurAnimator.startAnimation()
            runningAnimations.append(blurAnimator)
            
        }
    }
    
    func startInteractiveTransition(state:CardState, duration:TimeInterval) {
        if runningAnimations.isEmpty {
            animateTransitionIfNeeded(state: state, duration: duration)
        }
        for animator in runningAnimations {
            animator.pauseAnimation()
            animationProgressWhenInterrupted = animator.fractionComplete
        }
    }
    
    func updateInteractiveTransition(fractionCompleted:CGFloat) {
        for animator in runningAnimations {
            animator.fractionComplete = fractionCompleted + animationProgressWhenInterrupted
        }
    }
    
    func continueInteractiveTransition (){
        for animator in runningAnimations {
            animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
        }
    }


}
