//
//  AppDelegate.swift
//  ADMobGenSDKSwift
//
//  Created by 陈坤 on 2019/3/25.
//  Copyright © 2019 陈坤. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, ADMobGenSplashAdDelegate {
    
    

    var window: UIWindow?
    var splash: ADMobGenSplashAd?
    var viewCon: ViewController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        ADMobGenSDKConfig.setLogLevel(ADMobGenLogLevel(rawValue: 1)!)
//        ADMobGenSDKConfig.setDebugMode(true)
        
        ADMobGenSDKConfig.initWithAppId("2938412") { (error) in
            if error != nil {
                NSLog("SDK初始化失败")
            }
        }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        viewCon = ViewController()
        
        let nav = UINavigationController(rootViewController: viewCon!)
        
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
        
        loadSplash()
        
        
        return true
    }
    
    func loadSplash(){
        splash = ADMobGenSplashAd.init()
        splash?.delegate = self
        
        let imageBackGround = UIImage.init(named: "750x1334.png")
        let color = UIColor.init(patternImage: imageBackGround!)
        
        splash?.backgroundColor = color
        
        splash?.loadAndShow(in: window, withBottomView: nil)
        
    }
    
    func admg_splashAdSuccess(toPresentScreen splashAd: ADMobGenSplashAd!) {
        print(#function)
    }
    
    func admg_splashAd(_ splash: ADMobGenSplashAd!, failToPresentScreen error: Error!) {
        print(#function)
    }
    
    func admg_splashAdClicked(_ splashAd: ADMobGenSplashAd!) {
        print(#function)
    }
    
    func admg_splashAdClosed(_ splashAd: ADMobGenSplashAd!) {
        print(#function)
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func isIphoneX() -> Bool {
        return UIScreen.main.nativeBounds.size.height-2436 == 0 ? true : false
    }
    func isSmallIphone() -> Bool {
        return UIScreen.main.bounds.size.height == 480 ? true : false
    }


}

