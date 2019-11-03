//
//  AppDelegate.swift
//  WKWebViewNotificationExample
//
//  Created by Peter Thomas Horn on 28.10.19.
//  Copyright © 2019 Peter Thomas Horn. All rights reserved.
//

import Cocoa
import UserNotifications

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, UNUserNotificationCenterDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Necessary for enabling control of notification presentation while app is in foreground (see below).
        UNUserNotificationCenter.current().delegate = self
        
        // Request authorization for posting user notifications.
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert]) { (granted, error) in
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

