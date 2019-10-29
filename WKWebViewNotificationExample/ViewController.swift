//
//  ViewController.swift
//  WKWebViewNotificationExample
//
//  Created by Private on 28.10.19.
//  Copyright © 2019 Peter Thomas Horn. All rights reserved.
//

import Cocoa
import UserNotifications
import WebKit

class ViewController: NSViewController, WKScriptMessageHandler {

    override func viewDidLoad() {
        super.viewDidLoad()

        let userScriptURL = Bundle.main.url(forResource: "UserScript", withExtension: "js")!
        let userScriptCode = try! String(contentsOf: userScriptURL)
        let userScript = WKUserScript(source: userScriptCode, injectionTime: .atDocumentStart, forMainFrameOnly: false)
        let configuration = WKWebViewConfiguration()
        configuration.userContentController.addUserScript(userScript)
        configuration.userContentController.add(self, name: "notify")
        
        let documentURL = Bundle.main.url(forResource: "Document", withExtension: "html")!
        let webView = WKWebView(frame: view.frame, configuration: configuration)
        webView.loadFileURL(documentURL, allowingReadAccessTo: documentURL)
        
        view.addSubview(webView)
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        let content = UNMutableNotificationContent()
        content.title = "WKWebView Notification Example"
        content.body = message.body as! String
        
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: nil)

        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request) { (error) in
            if error != nil {
                NSLog(error.debugDescription)
            }
        }
    }
    
}

