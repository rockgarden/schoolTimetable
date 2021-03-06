//
//  UserDefault.swift
//  存储用户数据
//
//  Created by JarlRyan on 14/7/16.
//  Copyright (c) 2014 eastcom. All rights reserved.
//


import UIKit

class UserDefault: NSObject {

    struct Static {
        static var token: dispatch_once_t = 0
        static var instance: UserDefault?
    }

    class var instance: UserDefault {
        dispatch_once(&Static.token) { Static.instance = UserDefault() }
        return Static.instance!
    }

    var defaults : NSUserDefaults!

    override init() {
        super.init()
        self.defaults = NSUserDefaults.standardUserDefaults()
    }

    /**
     保存App是否首次运行
     - parameter isFirst: 是否首次运行
     */
    func setIsFirstRunApp(isFirst:Bool){
        self.defaults.setObject(isFirst,forKey:"isFirstRunApp")
        self.defaults.synchronize()
    }

    func isFirstRunApp()->Bool{
        let isFirstRunApp:Bool? = self.defaults.objectForKey("isFirstRunApp") as? Bool
        if isFirstRunApp == nil{
            return true
        }
        return isFirstRunApp! as Bool
    }

    func setIsLoginStatus(isLoginStatus:Bool){
        self.defaults.setObject(isLoginStatus,forKey:"isLoginStatus")
        self.defaults.synchronize()
    }

    func isLoginStatus()->Bool{
        let isLoginStatus:Bool? = self.defaults.objectForKey("isLoginStatus") as? Bool
        if isLoginStatus == nil{
            return false
        }
        return isLoginStatus! as Bool
    }

    func setIsInitTabStatus(isInitTabStatus:Bool){
        self.defaults.setObject(isInitTabStatus,forKey:"isInitTabStatus")
        self.defaults.synchronize()
    }

    func isInitTabStatus()->Bool{
        let isInitTabStatus:Bool? = self.defaults.objectForKey("isInitTabStatus") as? Bool
        if isInitTabStatus == nil{
            return false
        }
        return isInitTabStatus! as Bool
    }

    func setData(key: String, data: AnyObject) {
        self.defaults.setObject(data, forKey: key)
        self.defaults.synchronize()
    }

    func getData(key: String) ->AnyObject? {
        return self.defaults.objectForKey(key)
    }

    func removeData(key: String) {
        self.defaults.removeObjectForKey(key)
    }

    // 应用缓存数据清除
    func clearCacheData(){
        self.defaults.removeObjectForKey("initData")
        self.defaults.removeObjectForKey("Harpy Stored Date From Last Version Check")
    }

    func removeObjectForKey(str : String){
        self.defaults.removeObjectForKey(str)
    }

    func setUserId(userId:Int){
        self.defaults.setObject(String(userId) as NSString,forKey:"userId")
        self.defaults.synchronize()
    }

    func userId()->Int{
        return Int((self.defaults.objectForKey("userId") as! String))!
    }

    func setPassword(password:String){
        self.defaults.setObject(password,forKey:"userPsw")
        self.defaults.synchronize()
    }

    func password()->String? {
        return self.defaults.objectForKey("userPsw") as? String
    }

    func clearPassword() {
        self.defaults.removeObjectForKey("userPsw")
    }

    func setLoginName(loginName:String){
        self.defaults.setObject(loginName, forKey: "loginName")
        self.defaults.synchronize()
    }

    func loginName() ->String? {
        return self.defaults.objectForKey("loginName") as? String
    }

    func setUserName(userName:String){
        self.defaults.setObject(userName, forKey: "userName")
        self.defaults.synchronize()
    }

    func userName() ->String? {
        return self.defaults.objectForKey("userName") as? String
    }

    func setCity(city:String){
        self.defaults.setObject(city, forKey: "city")
        self.defaults.synchronize()
    }

    func city() ->String? {
        let city:String? = self.defaults.objectForKey("city") as? String
        if city == nil{
            return "Null"
        }
        return city
    }

    func setRealName(realName:String){
        self.defaults.setObject(realName, forKey: "realName")
        self.defaults.synchronize()
    }

    func realName() ->String? {
        return self.defaults.objectForKey("realName") as? String
    }

    func setToken(token:String){
        self.defaults.setObject(token, forKey: "token")
        self.defaults.synchronize()
    }

    func token() -> String? {
        //        if let token : String = self.defaults.objectForKey("token") as? String {
        //            return token
        //        }else{
        //            return ""
        //        }
        return self.defaults.objectForKey("token") as? String
    }

    func clearToken() {
        self.defaults.removeObjectForKey("token")
    }

    func setModules(modules:NSArray){
        self.defaults.setObject(modules, forKey: "modules")
        self.defaults.synchronize()
    }

    func modules() -> NSArray?{
        return self.defaults.objectForKey("modules") as? NSArray
    }

    func setDefaultModule(defaultModule:Int){
        self.defaults.setObject(defaultModule, forKey: "defaultModule")
        self.defaults.synchronize()
    }

    func defaultModule() -> Int?{
        return self.defaults.objectForKey("defaultModule") as? Int
    }

    func setAreas(areas:NSDictionary){
        self.defaults.setObject(areas, forKey: "areas")
        self.defaults.synchronize()
    }

    func areas() -> NSDictionary{
        return self.defaults.objectForKey("areas") as! NSDictionary
    }

    func setCustermerSearchJSON(arr:NSString){
        self.defaults.setObject(arr, forKey: "custermerSearch")
        self.defaults.synchronize()
    }

    func getCustermerSearchJSON() -> NSString?{
        return self.defaults.objectForKey("custermerSearch") as? NSString
    }

    func setProjectSearchJSON(arr:NSString){
        self.defaults.setObject(arr, forKey: "projectSearch")
        self.defaults.synchronize()
    }

    func getProjectSearchJSON() -> NSString?{
        return self.defaults.objectForKey("projectSearch") as? NSString
    }

    func setBusinessSearchJSON(arr:NSString){
        self.defaults.setObject(arr, forKey: "businessSearch")
        self.defaults.synchronize()
    }

    func getBusinessSearchJSON() -> NSString?{
        return self.defaults.objectForKey("businessSearch") as? NSString
    }

    func setUserInfos(user:User){
        self.defaults.setObject(user.userId,forKey:"userId")
        self.defaults.setObject(user.userName,forKey:"userName")
        self.defaults.setObject(user.userPsw,forKey:"userPsw")
        self.defaults.synchronize()
    }

    func setIsDayStyle(isDayStyle:Bool){
        self.defaults.setObject(isDayStyle,forKey:"isDayStyle")
        self.defaults.synchronize()
    }

    func setBackgroundRefreshStatus(backgroundRefreshStatus:Bool){self.defaults.setObject(backgroundRefreshStatus,forKey:"backgroundRefreshStatus")
        self.defaults.synchronize()
    }

    func getBackgroundRefreshStatus()->Bool{
        let backgroundRefreshOn:Bool? = self.defaults.objectForKey("backgroundRefreshStatus") as? Bool
        if backgroundRefreshOn == nil{
            return false
        }
        return backgroundRefreshOn! as Bool
    }

    func isDayStyle()->Bool{
        let isDayStyle:Bool? = self.defaults.objectForKey("isDayStyle") as? Bool
        if isDayStyle == nil{
            return true
        }
        return isDayStyle! as Bool
    }

    func setIsSaveUser(isSaveUser:Bool){
        self.defaults.setObject(isSaveUser,forKey:"isSaveUser")
        self.defaults.synchronize()
    }

    func isSaveUser()->Bool{
        let isSaveUser:Bool? = self.defaults.objectForKey("isSaveUser") as? Bool
        if isSaveUser == nil{
            return false
        }
        return isSaveUser! as Bool
    }

    func setIsAutoLogin(isSaveUser:Bool){
        self.defaults.setObject(isSaveUser,forKey:"isAutoLogin")
        self.defaults.synchronize()
    }

    func isAutoLogin() -> Bool{
        let isAutoLogin:Bool? = self.defaults.objectForKey("isAutoLogin") as? Bool
        if isAutoLogin == nil{
            return false
        }
        return isAutoLogin! as Bool
    }
    
}
