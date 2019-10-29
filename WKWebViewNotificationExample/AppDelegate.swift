//
//  AppDelegate.swift
//  WKWebViewNotificationExample
//
//  Created by Private on 28.10.19.
//  Copyright © 2019 Peter Thomas Horn. All rights reserved.
//

import Cocoa
import UserNotifications

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, UNUserNotificationCenterDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        UNUserNotificationCenter.current().delegate = self
        
        // Request authorization to post notifications
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert]) { (granted, error) in
            // Enable or disable features based on authorization.
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    // MARK: UNUserNotificationCenterDelegate
    
    // Not necessary but included for this example as it likely is running in the foreground.
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler(UNNotificationPresentationOptions.alert)
    }
    
}

