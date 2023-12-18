//
//  AppDelegate.swift
//  swiftDeer
//
//  Created by coderXY on 2023/12/16.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()
        window?.backgroundColor = UIColor.white
        // 判断是否已经登陆
        let logined:NSNumber? = UserDefaults.standard.object(forKey: "deerLogined") as? NSNumber
        
        window?.rootViewController = XYBaseNavigationController.init(rootViewController: XYDeerLoginController())
        window?.makeKeyAndVisible()
        return true
    }
}

