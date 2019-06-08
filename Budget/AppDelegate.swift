//
//  AppDelegate.swift
//  Budget
//
//  Created by William Archimède on 12/07/2017.
//  Copyright © 2017 William Archimede. All rights reserved.
//

import UIKit
import CoreData
import Fabric
import Crashlytics
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        Fabric.with([Crashlytics.self])
        FirebaseApp.configure()
        GADMobileAds.configure(withApplicationID: "ca-app-pub-7814673314543067~6958433240")

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}

    // MARK: Quick actions shortcuts
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        defer { completionHandler(true) }
        handle(shortcutItem)
    }
}
