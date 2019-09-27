//
//  AppDelegate.swift
//  Turismus
//
//  Created by Nikita Arutyunov on 28.09.2019.
//  Copyright © 2019 Nikita Arutyunov. All rights reserved.
//

import UIKit
import AsyncDisplayKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    let auth = UINavigationController(rootViewController: UIViewController())
    
    UINavigationBar.appearance().tintColor = .brown
    
    window = UIWindow()
    window?.backgroundColor = .white
    window?.rootViewController = auth
    window?.makeKeyAndVisible()
    
    ASDisableLogging()
    
    return true
  }

}

