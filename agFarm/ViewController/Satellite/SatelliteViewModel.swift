
//
//  SatelliteViewModel.swift
//  agFarm
//
//  Created by shashikant kadgi on 25/09/19.
//  Copyright © 2019 shashikant kadgi. All rights reserved.
//

import UIKit
import SwiftyJSON

class SatelliteViewModel: NSObject {
    
    @IBOutlet var apiClient: APIClient!
    
    func addFarm(url:String?,postData:[String:Any], completion: @escaping([String:Any]?) -> ()) {
        
//        apiClient.requestPost(url!, postData: postData, success: { (data) in
//
//
//            guard let result  = data["data"].dictionaryObject else { return }
//
//            completion(result)
//
//        }) { (error) in
//
//        }
    }
    
    func getDateList(plotID:String? ,completion: @escaping(JSON) -> ())  {
        
        apiClient.fetchDate(plotID: plotID!) { (data, error) in
            
            completion(data!)
        }
    }
    
    func getSatelliteViewJsonUrl(plotID:String?,date:String?,brightnessID: String? , completion: @escaping(JSON) -> ()) {
        
        apiClient.getSatelliteJsonUrl(plotID: plotID!, date: date!, brightnessID: brightnessID!) { (data, error) in
            
            completion(data!)
        }
    }
    func getPlotView(satelliteURL: String?, completion: @escaping(JSON) -> ()){
        
        apiClient.getSatellitePlot(satelliteURL: satelliteURL!) { (data, error) in
            
            completion(data!)
        }
        
    }
}
