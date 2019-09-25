//
//  LoginViewModel.swift
//  ProjectModelDemo
//
//  Created by shashikant kadgi on 04/09/19.
//  Copyright © 2019 shashikant kadgi. All rights reserved.
//

import Foundation
import  SwiftyJSON
class LoginViewModel : NSObject {
    
//    var farmersList = [NSDictionary]()
//
//    func getLoginDetails(url: String? , postData:[String:Any]?, success:@escaping () -> (), failure:@escaping () -> ()) {
//        APIClient.sharedInstance.requestPost(url!, postData: postData!, success: { (result) in
//
//            success()
//
//        }) { (error) in
//
//            failure()
//        }
//    }
    @IBOutlet var apiClient: APIClient!
    var loginArray: NSDictionary?
    var secreteData: NSDictionary?
    var  errorMessage: String?
    func authenticateData(username: String, password: String,completion: @escaping () -> ()) {
        apiClient.AuthenticateUser(username: username, password: password) { loginData in
            self.loginArray = loginData
            UserDefaults.standard.set(true, forKey: Constant.isUserLoggedIn)
            completion()
        }
    }
    
    func secreatData(username: String, completion: @escaping () -> ()) {
        apiClient.getSecreatUserKey(username: username) { userData , error  in
           
            guard let userData = userData, error == nil else {
               
                self.errorMessage = error?.localizedDescription
                
                return completion()
            }
           let data = userData.value(forKey: "data") as! NSDictionary
           self.secreteData = data.value(forKey: "result") as! NSDictionary
            
        
            completion()
        }
    }
    
    func fetchReferenceData(completion: @escaping (JSON) -> ()) {
        apiClient.getRefData { (resut, error) in
        
            print(resut)
            completion(resut!)
        }
    }
    func getArray() -> NSDictionary {
        return self.loginArray!
    }
    
    func getArraySecrete() -> NSDictionary? {
        return self.secreteData
    }
    func getErrorMessage() -> String? {
        
        return self.errorMessage
    }
}
