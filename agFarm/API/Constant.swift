//
//  Constant.swift
//  ProjectModelDemo
//
//  Created by shashikant kadgi on 03/09/19.
//  Copyright © 2019 shashikant kadgi. All rights reserved.
//

import Foundation
import UIKit

class Constant {
    
    
    static let STORYBOARD_NAME = "Main"
    static let WARNING = "Warning..!!!."
    static let PPHONE_NUMBER = "Please enter your User Phone Number ."
    static let PLEASE_ENTER_USER_NAME = "Please enter your User Name!!!."
    static let PLEASE_ENTER_PASS = "Please enter your password."
    static let PLEASE_ENTER_STRONG_PASSWORD = "Please Ensure Password has 1.two uppercase letters 2.one special character 3.has two digits 4.three lowercase letters. 5.password length is 8"
    static let MAX_LENGTH_PASS = "Password must be more than 8 characters."
    static let OK = "Ok"
    static let CANCEL = "CANCEL"
    static let DELETE = "DELETE"
    static let SAVE = "SAVE"
    static let Yes = "Yes"
    static let No = "No"
    static let isUserLoggedIn = "isUserLoggedIn"
    
    struct Color {
       
        static let SavanColor = UIColor.init(hexString: "285C35")
    }
    struct Url {
        static let BASE_URL = "http://192.168.0.52/v2/agfarm/"
        static var GET_SALT =  Urls.BASE_URL + "user/getSalt"
        static var AUTHENTICATION_USER = Urls.BASE_URL + "authenticationUser"
        static var ADD_FARM = Urls.BASE_URL + "saveFarm"
        static let REFDATA =  Urls.BASE_URL + "appdata/getReferenceData"
    }
    
}
class Urls {
    
    static let SATELLITE_BASE_URL = "http://plots.prakshep.com/myplots/"
    static let BASE_URL = "http://192.168.0.52/v2/agfarm/"
    static var GET_SALT =  Urls.BASE_URL + "user/getSalt"
    static var GET_FARMFIELD =  Urls.BASE_URL + "user/getFarmerFieldDetails"
    static var AUTHENTICATION_USER = Urls.BASE_URL + "user/authenticationUser"
    static var ADD_FARm = Urls.BASE_URL + "saveFarm"
    static let REFDATA =  Urls.BASE_URL + "appdata/getReferenceData"
    static let FARMDETAILS = Urls.BASE_URL + "User/getFarmerFieldDetails"
}
class FontNames {
    
    static let RobotoRegular = "Roboto-Regular"
    static let RobotoMedium = "Roboto-Medium"
    static let RobotoBold = "Roboto-Bold"
    static let UbuntuRegular = "Ubuntu-Regular"
    static let UbuntuMedium = "Ubuntu-Medium"
    static let UbuntuBold = "Ubuntu-Bold"
}

class ServerMessage {
    
    static let InvalidUser = "Invalid Username or Password"
    static let ServerConnection = "Could not connect to the server."
    static let RMLotDeleted = "RM Lot deleted Successfullly."
    static let FGLotPresented = "FG Lot has already been generated for this RM Lot."
}

class AlerMessage {
    
    static let internetConnection = "Please check internet connection and try again..!!"
    static let LogOut = "Logout"
    static let confirmeLogout = "\nAre you sure want to Logout?"
}



