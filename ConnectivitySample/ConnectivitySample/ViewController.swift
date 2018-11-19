//
//  ViewController.swift
//  ConnectivitySample
//
//  Created by Fodé Guirassy on 04/10/2018.
//  Copyright © 2018 Fodé Guirassy. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController {

    
    @IBOutlet weak var InputTextField: UITextField!
    
    @IBAction func touchSendInput(_ sender: Any) {
        /*
        let session = WCSession.default
        guard session.isReachable && session.isPaired,
        let number = self.InputTextField.text
        else {
            return
        }
        
        session.transferUserInfo([
            "value" : number
        ])
        */
        
        let session = WCSession.default
        guard session.isWatchAppInstalled && session.isReachable else {
            return
        }
        
        session.sendMessage(["hello": "World"], replyHandler: nil) { (error) in
            print(error)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

