//
//  ViewController.swift
//  Snake
//
//  Created by Fodé Guirassy on 04/10/2018.
//  Copyright © 2018 Fodé Guirassy. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController {

    @IBOutlet weak var snakeView: UIView!
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController : WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
    }
    
    
    @objc func goToDirection(direction : String) {
        
        DispatchQueue.main.async {
            var frame = self.snakeView.frame
            frame.origin.y += 10
            self.snakeView.frame = frame
        }
    
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        //aView.frame = CGRectMake( 100, 200, aView.frame.size.width, aView.frame.size.height ); // set new position exactly
        
        guard let d = message["direction"] as? String else {
            return
        }
        
        switch d {
        
        case "Down":
            
            DispatchQueue.main.async {
                var frame = self.snakeView.frame
                
                if(self.snakeView.frame.origin.y == self.view.frame.origin.y) {
                    frame.origin.y = 0
                } else {
                    frame.origin.y += 10
                }
                
                self.snakeView.frame = frame
            
            }
            
        case "Left":
            DispatchQueue.main.async {
                
                var frame = self.snakeView.frame
                frame.origin.x -= 10
                self.snakeView.frame = frame
            }
            
        case "Right":
            DispatchQueue.main.async {
                var frame = self.snakeView.frame
                frame.origin.x += 10
                self.snakeView.frame = frame
            }
            
        case "Up":
            
            DispatchQueue.main.async {
                var frame = self.snakeView.frame
                frame.origin.y -= 10
                self.snakeView.frame = frame
            }
            
        default:
            return
        }
    
    }
    
}
