//
//  AppDelegate.swift
//  mylesson
//
//  Created by wk on 16/2/19.
//  Copyright © 2016年 wk. All rights reserved.
//

import UIKit

public let serviceUrl = PlistUtil.getAppDefaultDictionary("ServiceUrl") as! String
public let appID = PlistUtil.getAppDefaultDictionary("appID") as! String
public let appName = PlistUtil.getAppDefaultDictionary("appName") as! String
public var appVersion = NSBundle.mainBundle().objectForInfoDictionaryKey(kCFBundleVersionKey as String) as! String!

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window!.makeKeyAndVisible()

        // 设定启动界面展示时间
        NSThread.sleepForTimeInterval(0.0)

        // 设定根视图控制器
        setRootViewCotnroller()

        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


    // MARK: - Private mothod

    /**
     动态加载rootViewController
     */
    func setRootViewCotnroller() {
        setRootViewCotnroller(UserDefault.instance.isFirstRunApp())
    }

    /**
     设定rootViewController
     - parameter flag: 是否首次启动
     */
    func setRootViewCotnroller(flag : Bool){
        let launchVC = UIStoryboard.getViewControllerFromStoryboard("launchVC", storyboard: "Launch") as! LaunchVC
        self.window?.rootViewController = launchVC
        if !flag {
            let splitVC = UIStoryboard.getViewControllerFromStoryboard("splitVC", storyboard: "Main") as! UISplitViewController
            self.window!.rootViewController = splitVC
            let navigationController = splitVC.viewControllers[splitVC.viewControllers.count-1] as! UINavigationController
            navigationController.topViewController!.navigationItem.leftBarButtonItem = splitVC.displayModeButtonItem()
            splitVC.delegate = self
        }
    }

    // MARK: - Split view

    func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController:UIViewController, ontoPrimaryViewController primaryViewController:UIViewController) -> Bool {
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
        guard let topAsDetailController = secondaryAsNavController.topViewController as? DetailViewController else { return false }
        if topAsDetailController.detailItem == nil {
            // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
            return true
        }
        return false
    }
    
}

