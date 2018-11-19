//
//  AccessoryBrowserViewController.swift
//  MyHomeApp
//
//  Created by Fodé Guirassy on 15/11/2018.
//  Copyright © 2018 Digipolitan. All rights reserved.
//

import UIKit
import HomeKit

class AccessoryBrowserViewController: UIViewController {

    var selectedHome : HMHome! = nil
    var accessoryBrowser : HMAccessoryBrowser!
    @IBOutlet weak var accessoryTableView: UITableView!
    
    var accessoriesTab : [HMAccessory] = [] {
        didSet {
            self.accessoryTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.accessoryTableView.delegate = self
        self.accessoryTableView.dataSource = self
        self.accessoryBrowser = HMAccessoryBrowser()
        self.accessoryBrowser.delegate = self
        self.accessoryBrowser.startSearchingForNewAccessories()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension AccessoryBrowserViewController : HMAccessoryBrowserDelegate {
    
    func accessoryBrowser(_ browser: HMAccessoryBrowser, didFindNewAccessory accessory: HMAccessory) {
        
    }
    
    func accessoryBrowser(_ browser: HMAccessoryBrowser, didRemoveNewAccessory accessory: HMAccessory) {
        
        if let index = self.accessoriesTab.index( where : { (acc) -> Bool in
            
            return acc.uniqueIdentifier == accessory.uniqueIdentifier
        }) {
            self.accessoriesTab.remove(at: index)
        }
    }
}

extension AccessoryBrowserViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedHome.addAccessory(self.accessoriesTab[indexPath.row]) { (err) in
            if(err == nil) {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}

extension AccessoryBrowserViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.selectedHome.accessories.count
        return self.accessoriesTab.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text  = self.accessoriesTab[indexPath.row].name
        return cell
    }
}


