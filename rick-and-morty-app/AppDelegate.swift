//
//  AppDelegate.swift
//  rick-and-morty-app
//
//  Created by Anton Kuzmin on 08.09.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow()
        window.rootViewController = ViewController()
        window.makeKeyAndVisible()
        
        self.window = window
        
        return true
    }
}

