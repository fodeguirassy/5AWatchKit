//
//  ServiceListViewController.swift
//  MyHomeApp
//
//  Created by Fodé Guirassy on 15/11/2018.
//  Copyright © 2018 Digipolitan. All rights reserved.
//

import UIKit
import HomeKit

class ServiceListViewController: UIViewController {
    
    var selectedAccessory : HMAccessory!
    
    @IBOutlet weak var servicesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = selectedAccessory.name
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ServiceListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var characterList = CharacteristicListViewController()
        characterList.selectedService = self.selectedAccessory.services[indexPath.row]
        self.navigationController?.pushViewController(characterList, animated: true)
    }
}

extension ServiceListViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.selectedAccessory.services.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let service = self.selectedAccessory.services[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(service.name) -- \(service.serviceType)"
        return cell
    }
}

