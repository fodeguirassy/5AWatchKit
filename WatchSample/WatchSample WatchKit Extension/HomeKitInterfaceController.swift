//
//  HomeKitInterfaceController.swift
//  WatchSample WatchKit Extension
//
//  Created by Fodé Guirassy on 10/09/2018.
//  Copyright © 2018 Fodé Guirassy. All rights reserved.
//

import WatchKit
import Foundation


class HomeKitInterfaceController: WKInterfaceController {
    
    
    @IBOutlet var slider: WKInterfaceSlider!
    @IBOutlet var hkSwitch: WKInterfaceSwitch!
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        guard let data = context as? [String : Any] else {
            return
        }
        
        if let val  = data["val"] as? Float {
            self.slider.setValue(val)
        }
        
        if let switchValue = data["homeKit"] as? Bool {
            self.hkSwitch.setOn(switchValue)
        }
        
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
