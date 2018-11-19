//
//  ViewController.swift
//  HomeKitSample
//
//  Created by Fodé Guirassy on 25/10/2018.
//  Copyright © 2018 Fodé Guirassy. All rights reserved.
//

import UIKit
import HomeKit

class ViewController: UIViewController {
    
    var homeManager : HMHomeManager!
    var accessoryBrowser : HMAccessoryBrowser!
    var currentHome : HMHome!
    
    var accessoriesAroundMe = [HMAccessory]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let manager = HMHomeManager()
        manager.delegate = self
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
    func primaryHomeAvailable(home : HMHome)  {
        
        self.currentHome = home
        
        let browser = HMAccessoryBrowser()
        browser.delegate = self
        browser.startSearchingForNewAccessories()
        self.accessoryBrowser = browser
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension ViewController : UITableViewDelegate {
    
    
}

extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return  self.accessoriesAroundMe.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell(style : .default, reuseIdentifier : nil)
            cell.textLabel?.text = self.accessoriesAroundMe[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    
}


extension ViewController : HMAccessoryBrowserDelegate {
    func accessoryBrowser(_ browser: HMAccessoryBrowser, didFindNewAccessory accessory: HMAccessory) {
        print(accessory)
        self.accessoriesAroundMe.append(accessory)
    }
    
    func accessoryBrowser(_ browser: HMAccessoryBrowser, didRemoveNewAccessory accessory: HMAccessory) {
        
    }
}


extension ViewController : HMHomeManagerDelegate {
    func homeManagerDidUpdateHomes(_ manager: HMHomeManager) {
        print("Hello World")
        
        if manager.primaryHome == nil {
            let home = manager.homes.first { (home) -> Bool in
                return home.name == "Palaiseau"
            }
            
            if home == nil {
                manager.addHome(withName: "Palaiseau") { (home,err) in
                    if err != nil {
                        return
                    }
                    
                    manager.updatePrimaryHome(home!) { (err) in
                        //TODO
                        
                        if err != nil {
                            return
                        }
                        
                        self.primaryHomeAvailable(home: home!)
                        
                    }
                    print(home)
                }
            } else {
                manager.updatePrimaryHome(home!) { (err) in
                    //
                    
                    self.primaryHomeAvailable(home: home!)
                }
            }
        } else {
            
           // self.primaryHomeAvailable(home: home!)
        }
        
       // self.homeManager = manager
       // print(self.homeManager.primaryHome)
    }
}


