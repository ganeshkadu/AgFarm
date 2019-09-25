//
//  agFarmContainerVC.swift
//  ProjectModelDemo
//
//  Created by shashikant kadgi on 06/09/19.
//  Copyright © 2019 shashikant kadgi. All rights reserved.
//

import UIKit

class agFarmContainerVC: UIViewController {

    @IBOutlet weak var btnBackOutlet: UIButton!
    @IBOutlet weak var btnSignInOutlet: UIButton!
    @IBOutlet weak var btnSignUpOutlet: UIButton!
    var container: ContainerViewController!
    override func viewDidLoad() {
        super.viewDidLoad()

      
       self.loginPage()
        
    }
    @IBAction func btnSignInTapped(_ sender: Any) {
        
         self.loginPage()
    }
    @IBAction func btnSignUpTapped(_ sender: Any) {
        
      self.signUpPage()
    }
    @IBAction func btnBackTapped(_ sender: Any) {
        
        self.loginPage()
    }
    fileprivate func loginPage() {
        
        container!.segueIdentifierReceivedFromParent("LoginVC")
        btnBackOutlet.isHidden = true
        btnSignInOutlet.layer.cornerRadius = 20
        btnSignInOutlet.backgroundColor = #colorLiteral(red: 0.7166094184, green: 0.8081033826, blue: 0.2471936643, alpha: 0.85)
        btnSignUpOutlet.backgroundColor = UIColor.clear
    }
    fileprivate func signUpPage(){
        container!.segueIdentifierReceivedFromParent("RegisterFirstVC")
        btnBackOutlet.isHidden = false
        btnSignUpOutlet.layer.cornerRadius = 20
        btnSignUpOutlet.backgroundColor = #colorLiteral(red: 0.7166094184, green: 0.8081033826, blue: 0.2471936643, alpha: 0.85)
        btnSignInOutlet.backgroundColor = UIColor.clear
    }
    // agFarm ContainerView
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "container"{
            container = segue.destination as! ContainerViewController
            //For adding animation to the transition of containerviews you can use container's object property
            // animationDurationWithOptions and pass in the time duration and transition animation option as a tuple
            // Animations that can be used
            // .transitionFlipFromLeft, .transitionFlipFromRight, .transitionCurlUp
            // .transitionCurlDown, .transitionCrossDissolve, .transitionFlipFromTop
            container.animationDurationWithOptions = (0.5, .transitionCrossDissolve)
           
        }
        
    }

}
