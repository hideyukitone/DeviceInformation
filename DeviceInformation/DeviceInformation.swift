//
//  DeviceInformation.swift
//
//  Created by hideyukitone on 2016/03/21.
//  Copyright © 2016年 hideyukitone. All rights reserved.
//

import Foundation
import UIKit

public class DeviceInformation {
    
    private enum DeviceType {
        case iPhone
        case iPhone_3G
        case iPhone_3GS
        case iPod_touch_5
        case iPod_touch_6
        case iPhone_4
        case iPhone_4S
        case iPhone_5
        case iPhone_5c
        case iPhone_5s
        case iPhone_6
        case iPhone_6_Plus
        case iPhone_6s
        case iPhone_6s_Plus
        case iPad_2
        case iPad_3
        case iPad_4
        case iPad_Air
        case iPad_Air_2
        case iPad_mini
        case iPad_mini_2
        case iPad_mini_3
        case iPad_mini_4
        case iPad_Pro
        case Apple_TV
        case Simulator
        
        init?(identifier: String) {
            switch identifier {
            case "iPod5,1" :
                self = .iPod_touch_5
            case "iPod7,1" :
                self = .iPod_touch_6
            case "iPhone1,1" :
                self = .iPhone
            case "iPhone1,2" :
                self = .iPhone_3G
            case "iPhone2,1" :
                self = .iPhone_3GS
            case "iPhone3,1", "iPhone3,2", "iPhone3,3" :
                self = .iPhone_4
            case "iPhone4,1" :
                self = .iPhone_4S
            case "iPhone5,1", "iPhone5,2" :
                self = .iPhone_5
            case "iPhone5,3", "iPhone5,4" :
                self = .iPhone_5c
            case "iPhone6,1", "iPhone6,2" :
                self = .iPhone_5s
            case "iPhone7,2" :
                self = .iPhone_6
            case "iPhone7,1" :
                self = .iPhone_6_Plus
            case "iPhone8,1" :
                self = .iPhone_6s
            case "iPhone8,2" :
                self = .iPhone_6s_Plus
            case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4" :
                self = .iPad_2
            case "iPad3,1", "iPad3,2", "iPad3,3" :
                self = .iPad_3
            case "iPad3,4", "iPad3,5", "iPad3,6" :
                self = .iPad_4
            case "iPad4,1", "iPad4,2", "iPad4,3" :
                self = .iPad_Air
            case "iPad5,3", "iPad5,4" :
                self = .iPad_Air_2
            case "iPad2,5", "iPad2,6", "iPad2,7" :
                self = .iPad_mini
            case "iPad4,4", "iPad4,5", "iPad4,6" :
                self = .iPad_mini_2
            case "iPad4,7", "iPad4,8", "iPad4,9" :
                self = .iPad_mini_3
            case "iPad5,1", "iPad5,2" :
                self = .iPad_mini_4
            case "iPad6,7", "iPad6,8" :
                self = .iPad_Pro
            case "AppleTV5,3" :
                self = .Apple_TV
            case "x86_64", "i386" :
                self = .Simulator
            default :
                return nil
            }
        }
        
        func name() -> String {
            switch self {
            case .iPod_touch_5 :
                return "iPod touch 5"
            case .iPod_touch_6 :
                return "iPod touch 6"
            case iPhone :
                return "iPhone"
            case iPhone_3G :
                return "iPhone 3G"
            case iPhone_3GS :
                return "iPhone 3GS"
            case .iPhone_4 :
                return "iPhone 4"
            case .iPhone_4S :
                return "iPhone 4S"
            case .iPhone_5 :
                return "iPhone 5"
            case .iPhone_5c :
                return "iPhone 5c"
            case .iPhone_5s :
                return "iPhone 5s"
            case .iPhone_6 :
                return "iPhone 6"
            case .iPhone_6_Plus :
                return "iPhone 6 Plus"
            case .iPhone_6s :
                return "iPhone 6s"
            case .iPhone_6s_Plus :
                return "iPhone 6s Plus"
            case .iPad_2 :
                return "iPad 2"
            case .iPad_3 :
                return "iPad 3"
            case .iPad_4 :
                return "iPad 4"
            case .iPad_Air :
                return "iPad Air"
            case iPad_Air_2 :
                return "iPad Air 2"
            case .iPad_mini :
                return "iPad mini"
            case .iPad_mini_2 :
                return "iPad mini 2"
            case iPad_mini_3 :
                return "iPad mini 3"
            case .iPad_mini_4 :
                return "iPad mini 4"
            case .iPad_Pro :
                return "iPad Pro"
            case .Apple_TV :
                return "Apple TV"
            case .Simulator :
                return "Simulator"
            }
        }
        
        func isiPhone() -> Bool {
            switch self {
            case .iPhone, .iPhone_3G, .iPhone_3GS
            , .iPhone_4, .iPhone_4S
            , .iPhone_5, .iPhone_5c, .iPhone_5s
            , .iPhone_6, .iPhone_6_Plus, .iPhone_6s, .iPhone_6s_Plus :
                return true
            default :
                return false
            }
        }
        
        func isiPodtouch() -> Bool {
            switch self {
            case .iPod_touch_5, .iPod_touch_6 :
                return true
            default :
                return false
            }
        }
        
        func isiPad() -> Bool {
            switch self {
            case .iPad_2, .iPad_3, .iPad_4
            , .iPad_Air, .iPad_Air_2
            , .iPad_mini, .iPad_mini_2, .iPad_mini_3, .iPad_mini_4
            , .iPad_Pro :
                return true
            default :
                return false
            }
        }
        
        func isAppleTV() -> Bool {
            switch self {
            case .Apple_TV :
                return true
            default :
                return false
            }
        }
        
        func isSimulator() -> Bool {
            switch self {
            case .Simulator :
                return true
            default :
                return false
            }
        }
    }
    
    /**
     デバイスのモデル名
     
     */
    public static var modelName: String {
        let identifier = myDeviceIdentifier
        return DeviceType(identifier: identifier)?.name() ?? identifier
    }
    
    /**
     iOSバージョン
     
     */
    public static var iOSVersion: String {
        return UIDevice.currentDevice().systemVersion
    }
    
    /**
     デバイスがiPhoneかの確認
     
     */
    public class func isiPhone() -> Bool {
        return DeviceType(identifier: myDeviceIdentifier)?.isiPhone() ?? false
    }
    
    /**
     デバイスがiPodtouchかの確認
     
     */
    public class func isiPodtouch() -> Bool {
        return DeviceType(identifier: myDeviceIdentifier)?.isiPodtouch() ?? false
    }
    
    /**
     デバイスがiPadかの確認
     
     */
    public class func isiPad() -> Bool {
        return DeviceType(identifier: myDeviceIdentifier)?.isiPad() ?? false
    }
    
    /**
     デバイスがAppleTVかの確認
     
     */
    public class func isAppleTV() -> Bool {
        return DeviceType(identifier: myDeviceIdentifier)?.isAppleTV() ?? false
    }
    
    /**
     デバイスがシミュレーターかの確認
     
     */
    public class func isSimulator() -> Bool {
        return DeviceType(identifier: myDeviceIdentifier)?.isSimulator() ?? false
    }
    
    private static var myDeviceIdentifier: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        
        let machine = systemInfo.machine
        let mirror = Mirror(reflecting: machine)
        var identifier = ""
        
        for children in mirror.children {
            if let value = children.value as? Int8 where value != 0 {
                identifier.append(UnicodeScalar(UInt8(value)))
            }
        }
        
        return identifier
    }
    
}