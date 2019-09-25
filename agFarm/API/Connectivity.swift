
//
//  Connectivity.swift
//  agFarm
//
//  Created by shashikant kadgi on 07/09/19.
//  Copyright © 2019 shashikant kadgi. All rights reserved.
//

import Foundation
import Alamofire


class Connectivity {
    
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager(host : "www.google.com")!.isReachable
    }
    
    class func isConnectedToWifi() -> Bool {
        return NetworkReachabilityManager(host : "www.google.com")!.isReachableOnEthernetOrWiFi
    }
}
