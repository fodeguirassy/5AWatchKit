//
//  InterfaceController.swift
//  WatchSample WatchKit Extension
//
//  Created by Fodé Guirassy on 10/09/2018.
//  Copyright © 2018 Fodé Guirassy. All rights reserved.
//

import WatchKit
import Foundation

extension WKInterfaceLabel {
    func setNewLine(text: String) {
        let res =  text.map{ return String($0)}
        let t = res.joined(separator : "\n")
        self.setText(t)
    }
}

class InterfaceController: WKInterfaceController {
    
    var isFofo  = false
    let text = "FOFODEV"
    let androidText = "ANDROID"
    
    @IBOutlet var androidTitle: WKInterfaceLabel!
    
    
    @IBAction func onNextClicked() {
        self.pushController(withName: "HK", context: [
            "val" : 9,
            "homekit" : true
            ])
    }
    
    
    @IBAction func onnewButnClicked() {
        
        if(isFofo) {
            self.androidTitle.setNewLine(text : androidText)
            isFofo = false
        } else {
            self.androidTitle.setNewLine(text : text)
            isFofo = true
        }
        
        self.pushController(withName: "List", context: nil)
        
    }
    
    func stretchText(text : String) -> String {
        var result = "";
        text.forEach{ char in
            result += String(char);
            result += "\n"
        }
        
        return result
    }
    
    @IBOutlet var mainLabel: WKInterfaceLabel!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        self.androidTitle.setNewLine(text : text)
    }
    
    @IBOutlet var image: WKInterfaceImage!
    
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    @IBOutlet var onButtonClicked: WKInterfaceButton!
    
    @IBAction func onClicked() {
        self.mainLabel.setText("Hello World")
        
    }
    
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
