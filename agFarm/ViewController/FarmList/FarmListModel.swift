//
//  FarmListModel.swift
//  agFarm
//
//  Created by shashikant kadgi on 25/09/19.
//  Copyright © 2019 shashikant kadgi. All rights reserved.
//

import Foundation
import SwiftyJSON


class FarmListModel: NSObject {
    var status: String?
    var message: String?
    var result: [FarmModel]?
    
    init(resultJson:JSON) {
        self.status = resultJson["status"].stringValue
        self.message = resultJson["message"].stringValue
        self.result = [FarmModel(farmJson: resultJson["result"])]
    }
}


class FarmModel: NSObject {
    
    var id: String?
    var farmer_id: String?
    var farm_code: String?
    var cultivation_year: String?
    var season_type_cat_id: String?
    var season_type_id: String?
    var farm_addr_line_1: String?
    var farm_addr_line_2: String?
    var zipcode: String?
    var village_cat_id: String?
    var village_id: String?
    var created_by: String?
    var created_date: String?
    var modified_by: String?
    var modified_date: String?
    
    init(farmJson:JSON) {
        
         self.id = farmJson["id"].stringValue
         self.farmer_id = farmJson["farmer_id"].stringValue
         self.farm_code = farmJson["farm_code"].stringValue
         self.cultivation_year = farmJson["cultivation_year"].stringValue
         self.season_type_cat_id = farmJson["season_type_cat_id"].stringValue
         self.season_type_id = farmJson["season_type_id"].stringValue
         self.farm_addr_line_1 = farmJson["farm_addr_line_1"].stringValue
         self.farm_addr_line_2 = farmJson["farm_addr_line_2"].stringValue
         self.zipcode = farmJson["zipcode"].stringValue
         self.village_cat_id = farmJson["village_cat_id"].stringValue
         self.village_id = farmJson["village_id"].stringValue
         self.created_by = farmJson["created_by"].stringValue
         self.created_date = farmJson["created_date"].stringValue
         self.modified_by = farmJson["modified_by"].stringValue
         self.modified_date = farmJson["modified_date"].stringValue
        
    }
    
}
class FieldModel: NSObject{
    
    var id: String?
    var farm_id: String?
    var field_code: String?
    var crop_id: String?
    var variety_type_cat_id: String?
    var variety_type_id: String?
    var field_area: String?
    var latitude: String?
    var longitude: String?
    var land_type_cat_id: String?
    var land_type_id: String?
    var created_by: String?
    var created_date: String?
    var modified_by: String?
    var modified_date: String?

    init(fieldJson:JSON) {
        
        self.id = fieldJson["id"].stringValue
        self.farm_id = fieldJson["farm_id"].stringValue
        self.field_code = fieldJson["field_code"].stringValue
        self.crop_id = fieldJson["crop_id"].stringValue
        self.variety_type_cat_id = fieldJson["variety_type_cat_id"].stringValue
        self.variety_type_id = fieldJson["variety_type_id"].stringValue
        self.field_area = fieldJson["field_area"].stringValue
        self.latitude = fieldJson["latitude"].stringValue
        self.longitude = fieldJson["longitude"].stringValue
        self.land_type_cat_id = fieldJson["land_type_cat_id"].stringValue
        self.land_type_id = fieldJson["land_type_id"].stringValue
        self.created_by = fieldJson["created_by"].stringValue
        self.created_date = fieldJson["created_date"].stringValue
        self.modified_by = fieldJson["modified_by"].stringValue
        self.modified_date = fieldJson["modified_date"].stringValue
        
    }
    
}


