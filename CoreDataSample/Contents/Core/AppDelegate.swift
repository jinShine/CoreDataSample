//
//  AppDelegate.swift
//  CoreDataSample
//
//  Created by seungjin on 2019/09/08.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        CoreDataManager.shared.setup(modelName: "CoreDatabase")
        
        return true
    }

}

