//
//  AppDelegate.swift
//  realtime_mic
//
//  Created by π on 16/07/2019.
//  Copyright © 2019 π. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    var mic : Mic!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        mic = Mic()
        try! mic.startRecording()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
        mic.stopRecording()
    }


}

