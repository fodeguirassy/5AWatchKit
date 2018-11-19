//
//  InterfaceController.swift
//  Snake WatchKit Extension
//
//  Created by Fodé Guirassy on 04/10/2018.
//  Copyright © 2018 Fodé Guirassy. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController {

    @IBAction func touchStart() {
        self.pushController(withName: "Play", context: nil)
    }
    
    
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
