//
//  AppDelegate.swift
//  BattleInDistress
//
//  Created by Nicholas Largen on 12/9/15.
//  Copyright © 2015 Nicholas Largen. All rights reserved.
//

import UIKit
import Parse
import ParseTwitterUtils
import FBSDKCoreKit
import ParseFacebookUtilsV4
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        Parse.enableLocalDatastore()
        
        // Initialize Parse.
        Parse.setApplicationId("esysVhlrka4midvNyYCkonfvBrX42mwYzjZOBDoT",
            clientKey: "UVwlML51bXSQLQ9bwxdnXmf8uDXlcOfJfijkuAV4")
        PFTwitterUtils.initializeWithConsumerKey("04ZvpXWc6HInjzcTUzpodzu1j",  consumerSecret: "2NpBcZeagDDLOfGO7L84PlNT7dSLbGQt00WyxnTQRVzPF7HJq3")
         PFFacebookUtils.initializeFacebookWithApplicationLaunchOptions(launchOptions)
        // [Optional] Track statistics around application opens.
        PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
        return true
    }

    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool
    {
        return FBSDKApplicationDelegate.sharedInstance().application(application,
            openURL: url,
            sourceApplication: sourceApplication,
            annotation: annotation)
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
        FBSDKAppEvents.activateApp()
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

