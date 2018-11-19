//
//  PlayInterfaceController.swift
//  Snake WatchKit Extension
//
//  Created by Fodé Guirassy on 04/10/2018.
//  Copyright © 2018 Fodé Guirassy. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class PlayInterfaceController: WKInterfaceController {
    
    @IBAction func touchUp() {
        
        let session = WCSession.default
        
        guard session.isReachable else {
            return
        }
        session.sendMessage(["direction": "Up"], replyHandler: nil) { (error) in
            print(error)
        }
    
    }
    
    @IBAction func touchRight() {
        
        
        let session = WCSession.default
        
        guard session.isReachable else {
            return
        }
        session.sendMessage(["direction": "Right"], replyHandler: nil) { (error) in
            print(error)
        }
        
    }
    
    
    @IBAction func touchDoxn() {
        
        let session = WCSession.default
        
        guard session.isReachable else {
            return
        }
        session.sendMessage(["direction": "Down"], replyHandler: nil) { (error) in
            print(error)
        }
    }
    
    @IBAction func touchLeft() {
        
        
        let session = WCSession.default
        
        guard session.isReachable else {
            return
        }
        session.sendMessage(["direction": "Left"], replyHandler: nil) { (error) in
            print(error)
        }
    }
    
    //@IBOutlet var touchLeft: WKInterfaceButton!
    //@IBOutlet var touchRight: WKInterfaceButton!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
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

extension PlayInterfaceController : WCSessionDelegate {
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
       // print("\(self.)")
    }
    
}
