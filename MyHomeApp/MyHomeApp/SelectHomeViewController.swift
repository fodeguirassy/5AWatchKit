//
//  SelectHomeViewController.swift
//  MyHomeApp
//
//  Created by Fodé Guirassy on 25/10/2018.
//  Copyright © 2018 Fodé Guirassy. All rights reserved.
//

import UIKit
import HomeKit

class SelectHomeViewController: UIViewController {

    var homeManager : HMHomeManager!
    
    
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "HomeApp"
        
        self.navigationItem.rightBarButtonItem =
            UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createNewHome))
        
        self.tableview.delegate = self
        self.tableview.dataSource = self
        
        self.homeManager = HMHomeManager()
        self.homeManager.delegate = self
        
    }
    
    @objc func createNewHome() {
        
        let alert = UIAlertController(title: "Create Home", message: nil, preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Home name"
        }
        
        alert.addAction(UIAlertAction(title:"Cancel", style:.cancel))
        
        alert.addAction(UIAlertAction(title:"Submit", style:.default, handler :  { (action)  in
            print("submit")
            
            guard let name = alert.textFields?[0].text else {
                return
            }
            
            self.homeManager.addHome(withName: name, completionHandler: { (h, err) in
            
                self.tableview.reloadData()
            })
        }))
        
        self.present(alert, animated: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension SelectHomeViewController : HMHomeManagerDelegate {
    func homeManagerDidUpdateHomes(_ manager: HMHomeManager) {
        self.tableview.reloadData()
    }
    
    func homeManager(_ manager: HMHomeManager, didAdd home: HMHome) {
        self.tableview.reloadData()
    }
    
    func homeManager(_ manager: HMHomeManager, didRemove home: HMHome) {
        self.tableview.reloadData()
    }
    
}

extension SelectHomeViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.homeManager.homes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier : nil)
        cell.textLabel?.text = self.homeManager.homes[indexPath.row].name
        return cell
    }
    
}


extension SelectHomeViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        //TODO
    
    }
   
}
