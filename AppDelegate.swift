//
//  AppDelegate.swift
//  ShuffleSongs
//
//  Created by Paulo Henrique dos Santos on 05/09/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        initCache()
        initMainScreen()
        return true
    }
    
    private func initMainScreen() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewControllerMain = SongListRouter().build()
        let navigationController = UINavigationController()
        navigationController.viewControllers = [viewControllerMain]
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    private func initCache() {
        let urlCache = URLCache(memoryCapacity: 4 * 1024 * 1024, diskCapacity: 20 * 1024 * 1024, diskPath: nil)
        URLCache.shared = urlCache
    }
}
