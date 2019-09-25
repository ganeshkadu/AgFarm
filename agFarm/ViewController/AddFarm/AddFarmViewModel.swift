//
//  AddFarmViewModel.swift
//  agFarm
//
//  Created by shashikant kadgi on 21/09/19.
//  Copyright © 2019 shashikant kadgi. All rights reserved.
//

import Foundation
import SwiftyJSON

class Farm : NSObject {
    
    let result: [String:Any]
    
    init(jsonData:JSON) {
        
        self.result = jsonData["result"].dictionaryValue
    }
}


class AddFarmViewModel : NSObject {
    
    @IBOutlet var apiClient: APIClient!
    
    func addFarm(url:String?,postData:[String:Any], completion: @escaping([String:Any]?) -> ()) {
        
        apiClient.requestPost(url!, postData: postData, success: { (data) in
            
            
            guard let result  = data["data"].dictionaryObject else { return }
        
            completion(result)

        }) { (error) in
            
            
        }

       
    }
    
}
