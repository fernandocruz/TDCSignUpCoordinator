//
//  AppDelegate.swift
//  TDCSignUpCoordinator
//
//  Created by Luis Fernando Cruz Santos on 24/03/2018.
//  Copyright © 2018 Fernando Cruz. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  var appCoordinator: Coordinator?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    let currentWindow = UIWindow(frame: UIScreen.main.bounds)
    self.appCoordinator = AppCoordinator(window: currentWindow, service: UserServiceImpl())
    self.appCoordinator?.start()
    self.window = currentWindow
    self.window?.makeKeyAndVisible()
    
    return true
  }
  
}

