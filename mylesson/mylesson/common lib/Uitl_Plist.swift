//
//  PlistUitl.swift
//  获取plist文件的数据
//
//  Created by wangkan on 16/4/11.
//  Copyright © 2016年 wk. All rights reserved.
//

import Foundation

class PlistUtil : NSObject {

    class func getAppDefaultDictionary(string:String)->AnyObject{
        let plistPath = NSBundle.mainBundle().pathForResource("AppDefault",ofType: "plist")
        let dictionary = NSDictionary(contentsOfFile:plistPath!)!
        return dictionary.objectForKey(string)!
    }

    class func getCustermerSearchSetFromPlist() -> NSArray {
        let plistPath = NSBundle.mainBundle().pathForResource("custermerSearchSet",ofType: "plist")
        return NSArray(contentsOfFile:plistPath!)!
    }

    class func getProjectSearchSetFromPlist() -> NSArray {
        let plistPath = NSBundle.mainBundle().pathForResource("projectSearchSet",ofType: "plist")
        return NSArray(contentsOfFile: plistPath!)!
    }

    class func getBusinessrSearchSetFromPlist() -> NSArray {
        let plistPath = NSBundle.mainBundle().pathForResource("businessSearchSet",ofType: "plist")
        return NSArray(contentsOfFile:plistPath!)!
    }

    class func getPerformanceSearchSetFromPlist() -> NSArray {
        let plistPath = NSBundle.mainBundle().pathForResource("performanceSearchSet",ofType: "plist")
        return NSArray(contentsOfFile:plistPath!)!
    }

    class func getBusinessDetailSearchSetFromPlist() -> NSArray {
        let plistPath = NSBundle.mainBundle().pathForResource("businessDetailSearchSet",ofType: "plist")
        return NSArray(contentsOfFile:plistPath!)!
    }
}
