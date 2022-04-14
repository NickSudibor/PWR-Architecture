//
//  AppDelegate.swift
//  PWR-Architecture
//
//  Created by Nick Sudibor on 12.04.22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let factory = ItemsFactory()
        window?.rootViewController = factory.build()
        window?.makeKeyAndVisible()
        
        return true
    }
}

