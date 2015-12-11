//
//  MainIC.swift
//  BattleInDistress
//
//  Created by Nicholas Largen on 12/11/15.
//  Copyright © 2015 Nicholas Largen. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class MainIC: WKInterfaceController, WCSessionDelegate{
    
    var session : WCSession!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }
    @IBAction func CheckinButtonPressed()
    {
        session.sendMessage(["TheButton" : "CheckIn"], replyHandler: nil, errorHandler: nil)
    }
    
    @IBAction func CheckupButtonPressed()
    {
        session.sendMessage(["TheButton" : "CheckUp"], replyHandler: nil, errorHandler: nil)
    }
    
    @IBAction func FindHelpButtonPressed()
    {
        session.sendMessage(["TheButton" : "FindHelp"], replyHandler: nil, errorHandler: nil)
    }
    
    @IBAction func SendHelpButtonPressed()
    {
        session.sendMessage(["TheButton" : "SendHelp"], replyHandler: nil, errorHandler: nil)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
