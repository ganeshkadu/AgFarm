
//
//  Extension+UIViewController.swift
//  ProjectModelDemo
//
//  Created by shashikant kadgi on 03/09/19.
//  Copyright © 2019 shashikant kadgi. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD
import Alamofire



extension UIViewController {
    
    
    func convert(cmage:CIImage) -> UIImage
    {
        let context:CIContext = CIContext.init(options: nil)
        let cgImage:CGImage = context.createCGImage(cmage, from: cmage.extent)!
        let image:UIImage = UIImage.init(cgImage: cgImage)
        return image
    }
    func getAuthenticateKey() -> String?{
        
        let username = UserDefaults.standard.string(forKey: "username")
        let password = UserDefaults.standard.string(forKey: "password")
        
        let str = "\(String(describing: username!)):\(String(describing: password!))"
        let base64Encoded = Data(str.utf8).base64EncodedString()
        
        return base64Encoded
    }
    func showAlert(title: String = "Alert", message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: Constant.OK, style: .default, handler: nil))
        alertController.setTitlet(font: UIFont(name: FontNames.UbuntuBold, size: 18.0), color: #colorLiteral(red: 0.1976502538, green: 0.4287701845, blue: 0.2695204318, alpha: 1))
        alertController.setMessage(font:UIFont(name: FontNames.UbuntuRegular, size: 14.0), color: #colorLiteral(red: 0.1976502538, green: 0.4287701845, blue: 0.2695204318, alpha: 1))
        alertController.setBackgroundColor(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        alertController.setTint(color: #colorLiteral(red: 0.1976502538, green: 0.4287701845, blue: 0.2695204318, alpha: 1))
        present(alertController, animated: true, completion: nil)
    }
    func showAlert(title: String?, message: String?, actionTitles:[String?], actions:[((UIAlertAction) -> Void)?]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, title) in actionTitles.enumerated() {
            let action = UIAlertAction(title: title, style: .default, handler: actions[index])
            alert.addAction(action)
        }
        alert.setTitlet(font: UIFont(name: FontNames.UbuntuBold, size: 18.0), color: #colorLiteral(red: 0.9870929122, green: 0.6826676726, blue: 0, alpha: 1))
        alert.setMessage(font:UIFont(name: FontNames.UbuntuRegular, size: 14.0), color: #colorLiteral(red: 0.9870929122, green: 0.6826676726, blue: 0, alpha: 1))
        alert.setBackgroundColor(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        alert.setTint(color: #colorLiteral(red: 0.9870929122, green: 0.6826676726, blue: 0, alpha: 1))
        self.present(alert, animated: true, completion: nil)
    }
    func showToast(message : String) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2, y: self.view.frame.size.height-100, width: 200, height: 90))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.numberOfLines = 0
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 9.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        toastLabel.center = self.view.center
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    func showSpinner() {
        let loadingNotification = MBProgressHUD.showAdded(to: self.view, animated: true)
        loadingNotification.mode = MBProgressHUDMode.indeterminate
        loadingNotification.label.text = "Please Wait..."
        loadingNotification.label.textColor = UIColor.white
        loadingNotification.contentColor = UIColor.white
        loadingNotification.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        loadingNotification.bezelView.backgroundColor = UIColor.black
    }
    
    func hideSpinner()
    {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    func HideStatusBar() {
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        statusBar.isHidden = true
    }
    
    func showStatusBar() {
        if let statusBar = UIApplication.shared.value(forKey: "statusBar") as? UIView {
            statusBar.backgroundColor = UIColor.init(hexString: "f99f00")
            statusBar.tintColor = UIColor.init(hexString: "f99f00")
        }
        setNavigate()
    }
    
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
    func setNavigate(){
        navigationController?.navigationBar.barTintColor = UIColor.init(hexString: "f99f00")
        navigationController?.navigationBar.tintColor = UIColor.init(hexString: "f99f00")
        //navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barStyle = .black
        //  let attributes = [NSAttributedStringKey.font: UIFont(name: "hankenround-Regular", size: 20)!]
        //navigationController?.navigationBar.titleTextAttributes = attributes
        // view.backgroundColor = UIColor.black
    }
}


extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}



extension UIView {
    
    func setCardView(view : UIView){
        
        view.layer.cornerRadius = 5.0
        view.layer.borderWidth = 4.0
        view.layer.borderColor = UIColor.clear.cgColor
        view.layer.masksToBounds = false
        view.clipsToBounds = true
        view.layer.shadowColor = UIColor.white.cgColor
        view.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        view.layer.shadowOpacity = 1.0
        view.layer.masksToBounds = false
        view.layer.shadowRadius = 4.0
        
    }
    func roundedTopRight(){
        let maskPath1 = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: [.topRight],
                                     cornerRadii: CGSize(width: 60, height: 60))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
    func roundTop(radius:CGFloat = 5){
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        if #available(iOS 11.0, *) {
            self.layer.maskedCorners = [.layerMaxXMinYCorner]
        } else {
            // Fallback on earlier versions
        }
    }
}

extension UISearchBar {
    
    func change(textFont : UIFont?) {
        
        for view : UIView in (self.subviews[0]).subviews {
            
            if let textField = view as? UITextField {
                textField.font = textFont
            }
        }
    } }

extension UIAlertController {
    //Set background color of UIAlertController
    func setBackgroundColor(color: UIColor) { if let bgView = self.view.subviews.first, let groupView = bgView.subviews.first, let contentView = groupView.subviews.first { contentView.backgroundColor = color } }
    
    //Set title font and title color
    func setTitlet(font: UIFont?, color: UIColor?) { guard let title = self.title else { return }
        let attributeString = NSMutableAttributedString(string: title)
        //1
        if let titleFont = font { attributeString.addAttributes([NSAttributedString.Key.font : titleFont],
                                                                //2
            range: NSMakeRange(0, title.utf8.count)) }
        if let titleColor = color { attributeString.addAttributes([NSAttributedString.Key.foregroundColor : titleColor],
                                                                  //3
            range: NSMakeRange(0, title.utf8.count)) }
        self.setValue(attributeString, forKey: "attributedTitle")
        //4
        
    } //Set message font and message color
    func setMessage(font: UIFont?, color: UIColor?) { guard let message = self.message else { return }
        let attributeString = NSMutableAttributedString(string: message)
        if let messageFont = font { attributeString.addAttributes([NSAttributedString.Key.font : messageFont], range: NSMakeRange(0, message.utf8.count)) }
        if let messageColorColor = color { attributeString.addAttributes([NSAttributedString.Key.foregroundColor : messageColorColor], range: NSMakeRange(0, message.utf8.count)) }
        self.setValue(attributeString, forKey: "attributedMessage") }
    //Set tint color of UIAlertController
    func setTint(color: UIColor) { self.view.tintColor = color }
    
}
extension UIImageView {
    
    func makeCircle() {
        let radius = self.frame.width/2.0
        self.layer.cornerRadius = radius
        
        self.layer.masksToBounds = true
    }
}


// use once to set all controler font
struct AppFontName {
    static let regular = "Roboto-Regular"
    static let bold = "Roboto-Bold"
    static let italic = "Roboto-Regular"
}

extension UIFontDescriptor.AttributeName {
    static let nsctFontUIUsage = UIFontDescriptor.AttributeName(rawValue: "NSCTFontUIUsageAttribute")
}

extension UIFont {

    @objc class func mySystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.regular, size: size)!
    }

    @objc class func myBoldSystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.bold, size: size)!
    }

    @objc class func myItalicSystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.italic, size: size)!
    }

    @objc convenience init(myCoder aDecoder: NSCoder) {
        guard
            let fontDescriptor = aDecoder.decodeObject(forKey: "UIFontDescriptor") as? UIFontDescriptor,
            let fontAttribute = fontDescriptor.fontAttributes[.nsctFontUIUsage] as? String else {
                self.init(myCoder: aDecoder)
                return
        }
        var fontName = ""
        switch fontAttribute {
        case "CTFontRegularUsage":
            fontName = AppFontName.regular
        case "CTFontEmphasizedUsage", "CTFontBoldUsage":
            fontName = AppFontName.bold
        case "CTFontObliqueUsage":
            fontName = AppFontName.italic
        default:
            fontName = AppFontName.regular
        }
        self.init(name: fontName, size: fontDescriptor.pointSize)!
    }

    class func overrideInitialize() {
        guard self == UIFont.self else { return }

        if let systemFontMethod = class_getClassMethod(self, #selector(systemFont(ofSize:))),
            let mySystemFontMethod = class_getClassMethod(self, #selector(mySystemFont(ofSize:))) {
            method_exchangeImplementations(systemFontMethod, mySystemFontMethod)
        }

        if let boldSystemFontMethod = class_getClassMethod(self, #selector(boldSystemFont(ofSize:))),
            let myBoldSystemFontMethod = class_getClassMethod(self, #selector(myBoldSystemFont(ofSize:))) {
            method_exchangeImplementations(boldSystemFontMethod, myBoldSystemFontMethod)
        }

        if let italicSystemFontMethod = class_getClassMethod(self, #selector(italicSystemFont(ofSize:))),
            let myItalicSystemFontMethod = class_getClassMethod(self, #selector(myItalicSystemFont(ofSize:))) {
            method_exchangeImplementations(italicSystemFontMethod, myItalicSystemFontMethod)
        }

        if let initCoderMethod = class_getInstanceMethod(self, #selector(UIFontDescriptor.init(coder:))), // Trick to get over the lack of UIFont.init(coder:))
            let myInitCoderMethod = class_getInstanceMethod(self, #selector(UIFont.init(myCoder:))) {
            method_exchangeImplementations(initCoderMethod, myInitCoderMethod)
        }
    }
}


extension Date {
    func convertToLocaleDate(template: String) -> String {
        let dateFormatter = DateFormatter()
        
        let calender = Calendar.current
        
        dateFormatter.timeZone = calender.timeZone
        dateFormatter.locale = calender.locale
        dateFormatter.setLocalizedDateFormatFromTemplate(template)
        
        return dateFormatter.string(from: self)
    }
}

enum DateFormatType : String {
    case type1 = "yyyy-MM-dd - HH:mm:ss"
    case type2 = "dd/MM/yyyy"
    case type3 = "yyyy/MM/dd"
}
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}


extension UITextField
{
    
    func setBorder() {
        self.layer.cornerRadius = 4.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = Constant.Color.SavanColor.cgColor
        self.layer.masksToBounds = true
        
        
    }
    
    
}


extension String {
    func isValidUsername(_ username : String) -> Bool{
        if username.count > 7 && username.count < 16{
            let regex =  "^[a-z]([a-z0-9]*[-_][a-z0-9][a-z0-9]*)$"
            
            let passwordTest = NSPredicate(format: "SELF MATCHES %@", regex)
            return passwordTest.evaluate(with: username)
        }else{
            return false
            
        }
    }
    
    var sha256:String? {
        guard let stringData = self.data(using: String.Encoding.utf16LittleEndian) else { return nil }
        return digest(input: stringData as NSData).base64EncodedString(options: [])
    }
    
    private func digest(input : NSData) -> NSData {
        let digestLength = Int(CC_SHA256_DIGEST_LENGTH)
        var hash = [UInt8](repeating: 0, count: digestLength)
        CC_SHA256(input.bytes, UInt32(input.length), &hash)
        return NSData(bytes: hash, length: digestLength)
    }
    
    
    
}
extension Data {
    
    var hexString: String {
        return map { String(format: "%02hhx", $0) }.joined()
    }
    
    var sha256: Data {
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
        self.withUnsafeBytes({
            _ = CC_SHA256($0, CC_LONG(self.count), &digest)
        })
        return Data(bytes: digest)
    }
    
}
