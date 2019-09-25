//
//  ProfileContainerVC.swift
//  agFarm
//
//  Created by Ganesh Kadu on 23/09/19.
//  Copyright © 2019 shashikant kadgi. All rights reserved.
//

import UIKit

class ProfileContainerVC: UIViewController {

    @IBOutlet weak var segOutlet: UISegmentedControl!
    var container: ContainerViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       // self.navigationController?.isNavigationBarHidden = false
        container!.segueIdentifierReceivedFromParent("EditProfileVC")
        
    }
    

    @IBAction func segmentTapped(_ sender: Any) {
        
        switch segOutlet.selectedSegmentIndex
        {
        case 0:
             container!.segueIdentifierReceivedFromParent("EditProfileVC")
        case 1:
            // container!.segueIdentifierReceivedFromParent("FieldDetailsVC")
            print("second")
        default:
            break
        }
    }
    @IBAction func btnBackTapped(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
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
