//
//  AccessoryListViewController.swift
//  MyHomeApp
//
//  Created by Fodé Guirassy on 15/11/2018.
//  Copyright © 2018 Digipolitan. All rights reserved.
//

import UIKit
import HomeKit

class AccessoryListViewController: UIViewController {
    
    var selectedHome : HMHome!
    
    @IBOutlet weak var accessoryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.selectedHome.name
        self.accessoryTableView.delegate = self
        self.accessoryTableView.dataSource  = self
        
        self.navigationItem.rightBarButtonItem  = UIBarButtonItem( barButtonSystemItem: .add, target: self, action: #selector(searchNewAccessories))
        self.title = "Searching ..."
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.accessoryTableView.reloadData()
    }
    
    
    @objc func searchNewAccessories() {
        var browserSelector = AccessoryBrowserViewController()
        browserSelector.selectedHome = self.selectedHome
        self.navigationController?.pushViewController(browserSelector, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension AccessoryListViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var serviceController = ServiceListViewController()
        serviceController.selectedAccessory = self.selectedHome.accessories[indexPath.row]
        self.navigationController?.pushViewController(serviceController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let acc = self.selectedHome.accessories[indexPath.row]
            self.selectedHome.removeAccessory(acc) { (err) in
                if err == nil {
                    self.accessoryTableView.reloadData()
                }
            }
        }
    }
}

extension AccessoryListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedHome.accessories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = self.selectedHome.accessories[indexPath.row].name
        return cell
    }
    
}
