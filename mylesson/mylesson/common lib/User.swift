//
//  User.swift
//  定义用户数据
//
//  Created by wangkan on 16/4/11.
//  Copyright © 2016年 wk. All rights reserved.
//

import Foundation

let JSON_KEY_USER_ID = "userId"
let JSON_KEY_USER_NAME = "userName"
let JSON_KEY_USER_PASSWORD = "userPsw"
let JSON_KEY_AUTHSTATE = "authState"
let JSON_KEY_SESSIONID = "sessionID"
let JSON_KEY_GROUPPURVIEW = "groupPurview"
let JSON_KEY_USERAUTHNUM = "userAuthNum"
let JSON_KEY_TICKPEOPLE = "tickPeople"

class User {

    var userId:Int!
    var userName:String!
    var userPsw:String!
    var authState:Int!
    var sessionID:String!
    var groupPurview:Int!
    var userAuthNum:Int!
    var tickPeople:String!

    init(userId:Int, userName:String, userPsw:String,authState:Int,sessionID:String,groupPurview:Int,userAuthNum:Int,tickPeople:String) {
        self.userId = userId
        self.userName = userName
        self.userPsw = userPsw
        self.authState = authState
        self.sessionID = sessionID
        self.groupPurview = groupPurview
        self.userAuthNum = userAuthNum
        self.tickPeople = tickPeople
    }

}