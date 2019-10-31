//
//   APIClient.swift
//  ProjectModelDemo
//
//  Created by shashikant kadgi on 03/09/19.
//  Copyright © 2019 shashikant kadgi. All rights reserved.
//

import UIKit
import Alamofire
import SystemConfiguration
import SwiftyJSON
import MBProgressHUD

class APIClient: NSObject{
    
    let delegate = UIApplication.shared.delegate as! AppDelegate

    
    let alert = UIAlertController()
    static let sharedInstance = APIClient()
//    lazy var headers: HTTPHeaders = {
//
//       [ "Authorization": "Basic ODkwNTk4Nzg5MDorR0pJT3p4MXQ4ekR0U1NldGNQS3pCOVFLWFpEcTNjbzNGTFl3dmtON3R3PQ==",
//        "Accept": "application/json",
//        "Content-Type" :"application/json",
//        "Content-type": "multipart/form-data"]
//
//    }()
    static let shared: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 30
        let sessionManager = Alamofire.SessionManager(configuration: configuration)
        return sessionManager
    }()
   
    private var sessionManager = Alamofire.SessionManager()
    
    let headers: HTTPHeaders = ["Authorization": "Basic ODkwNTk4Nzg5MDorR0pJT3p4MXQ4ekR0U1NldGNQS3pCOVFLWFpEcTNjbzNGTFl3dmtON3R3PQ=="]
    func requestPost(_ url : String, postData:[String:Any], success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void) {
       
        sessionManager.request(url, method:.post, parameters: postData,encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            print("Parameters = \(postData)")
            switch response.result {
            case .success:
                
               let json = JSON(response.result.value!)
               success(json)
               
               break
                
            case .failure(let error):
                
                    failure(error)
                    if error._code == NSURLErrorTimedOut {
                        
                     print("Request Time Out")
                    
                    }
                 
               break
            }
        }
    }
    
    func AuthenticateUser(username: String, password: String, completion: @escaping (NSDictionary) -> () ) {
        
        UserDefaults.standard.set(username, forKey: "username")
        UserDefaults.standard.set(password, forKey: "password")
        
        let headers: HTTPHeaders = [
            "Authorization": "Basic ODkwNTk4Nzg5OTorR0pJT3p4MXQ4ekR0U1NldGNQS3pCOVFLWFpEcTNjbzNGTFl3dmtON3R3PQ=="
        ]
        let param = [
            "userName":username,"password": "+GJIOzx1t8zDtSSetcPKzB9QKXZDq3co3FLYwvkN7tw="
            //"password": password, // "+GJIOzx1t8zDtSSetcPKzB9QKXZDq3co3FLYwvkN7tw=
            ] as [String : Any]
        
     
        print("param = \(param)")
        
        let url = Urls.AUTHENTICATION_USER
        
        
        //throw APIException.apiFailed(errMsg: "Something went wrong!")
        Alamofire.request(url, method:.post, parameters: param, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            switch response.result {
            case .success:
                let json = response.result.value as? NSDictionary
                completion(json!)
                return
            case .failure(let error):
             
                print(error.localizedDescription)
                
                
            }
        }
    }
    
    func getSecreatUserKey(username: String, completion: @escaping (NSDictionary?,Error?) -> ()  ) {
        
        let headers: HTTPHeaders = [
            "Authorization": "Basic ODkwNTk4Nzg5OTorR0pJT3p4MXQ4ekR0U1NldGNQS3pCOVFLWFpEcTNjbzNGTFl3dmtON3R3PQ=="
        ]
        
        
        let url = Urls.GET_SALT
        
        print(url)
        let param = ["userName": username] as [String : Any]
        
        //throw APIException.apiFailed(errMsg: "Something went wrong!")
        Alamofire.request(url, method:.post, parameters: param, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            switch response.result {
                
            case .success:
                print("response.result.value = \(response.result.value!)")
                let json =  response.result.value as? NSDictionary
                completion(json,nil)
                return
            case .failure(let error):
               
                completion(nil,error)
                print(error.localizedDescription)
            }
        }
    }
    
    
    func getFarmFieldList(farmerId: String, completion: @escaping (JSON?,Error?) -> ()  ) {
        
        let headers: HTTPHeaders = [
            "Authorization": "Basic ODkwNTk4Nzg5OTorR0pJT3p4MXQ4ekR0U1NldGNQS3pCOVFLWFpEcTNjbzNGTFl3dmtON3R3PQ=="
        ]
        
        
        let url = Urls.GET_FARMFIELD
        
        print(url)
        let param = ["farmerId": farmerId] as [String : Any]
        
        //throw APIException.apiFailed(errMsg: "Something went wrong!")
        Alamofire.request(url, method:.post, parameters: param, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            switch response.result {
                
            case .success:
                print("response.result.value = \(response.result.value!)")
                let json =  JSON(response.result.value!)
                completion(json,nil)
                return
            case .failure(let error):
                
                completion(nil,error)
                print(error.localizedDescription)
            }
        }
    }
    
    func getRefData(completion: @escaping (JSON?,Error?) -> ()  ) {
        
        let headers: HTTPHeaders = [
            "Authorization": "Basic ODkwNTk4Nzg5OTorR0pJT3p4MXQ4ekR0U1NldGNQS3pCOVFLWFpEcTNjbzNGTFl3dmtON3R3PQ=="
        ]
        
        let url = Urls.REFDATA
    
        //throw APIException.apiFailed(errMsg: "Something went wrong!")
        Alamofire.request(url, method:.post, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            switch response.result {
                
            case .success:
                print("response.result.value = \(response.result.value!)")
                let json =  JSON(response.result.value!)
                completion(json,nil)
                return
            case .failure(let error):
                
                completion(nil,error)
                print(error.localizedDescription)
            }
        }
    }
    
    
    
    
    func fetchDate(plotID:String, completion: @escaping (JSON?,Error?) -> ()  ) {
        
        
        let url = Urls.SATELLITE_BASE_URL + "datelist_agreeta?plotID=\(plotID)&seasonID=A2019"
        
        Alamofire.request(url, method:.post, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            switch response.result {
                
            case .success:
                print("response.result.value = \(response.result.value!)")
                let json =  JSON(response.result.value!)
                
                completion(json,nil)
                return
            case .failure(let error):
                
                completion(nil,error)
                print(error.localizedDescription)
            }
        }
    }
    
    func getSatelliteJsonUrl(plotID:String,date:String,brightnessID: String, completion: @escaping (JSON?,Error?) -> ()  ) {
        
        let url = "http://plots.prakshep.com/myplots/geojsonview_agreeta/?plotID=\(plotID)&seasonID=A2019&DateofAnalysis=\(date)&index=\(brightnessID)"
        
        print("URL = \(url)")
        Alamofire.request(url, method:.get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            switch response.result {
                
            case .success:
                print("response.result.value = \(response.result.value!)")
                let json =  JSON(response.result.value!)
                
                completion(json,nil)
                return
            case .failure(let error):
                
                completion(nil,error)
                print(error.localizedDescription)
            }
        }
    }
    
    func getSatellitePlot(satelliteURL:String, completion: @escaping (JSON?,Error?) -> ()  ) {
        
        
        Alamofire.request(satelliteURL, method:.get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            switch response.result {
                
            case .success:
                print("response.result.value = \(response.result.value!)")
                let json =  JSON(response.result.value!)
                
                completion(json,nil)
                return
            case .failure(let error):
                
                completion(nil,error)
                print(error.localizedDescription)
            }
        }
    }
    
        func getFarm(completion: @escaping (JSON?,Error?) -> ()  ) {
            let headers: HTTPHeaders = [
                "Authorization": "Basic ODkwNTk4Nzg5OTorR0pJT3p4MXQ4ekR0U1NldGNQS3pCOVFLWFpEcTNjbzNGTFl3dmtON3R3PQ=="
            ]
            let url = Urls.FARMDETAILS
            print(url)
            let param = ["farmerId":6] as! [String:Any]
            Alamofire.request(url, method:.post, parameters: param, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
                switch response.result {
                    
                case .success:
                    print("response.result.value = \(response.result.value!)")
                    let json =  JSON(response.result.value!)
                    
                    completion(json,nil)
                    return
                case .failure(let error):
                    
                    completion(nil,error)
                    print(error.localizedDescription)
                }
            }
        }
    
    
    
    
}

