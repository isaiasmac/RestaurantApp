//
//  AppDelegate.swift
//  RestaurantApp
//
//  Created by Isaías on 5/25/18.
//  Copyright © 2018 IsaiasMac. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let navCtrl = UINavigationController(rootViewController: SearchVC())
        self.window!.rootViewController = navCtrl
        self.window!.makeKeyAndVisible()
        
        UIApplication.shared.statusBarStyle = .lightContent // Agregar 'View controller-based status bar appearance' = NO (info.plist)
        
        return true
    }
    
    // Solo Portrait
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {

        return .portrait
    }


}

