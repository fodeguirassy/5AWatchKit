//
//  CharacteristicListViewController.swift
//  MyHomeApp
//
//  Created by Fodé Guirassy on 15/11/2018.
//  Copyright © 2018 Digipolitan. All rights reserved.
//

import UIKit
import HomeKit

class CharacteristicListViewController: UIViewController {
    
    var selectedService : HMService!
    
    @IBOutlet weak var characteristicTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.selectedService.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension CharacteristicListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let charac = self.selectedService.characteristics[indexPath.row]
        if var value = charac.value as? Int {
            value = value == 0 ? 1 : 0
            charac.writeValue(value) {
                (err) in
                if err == null {
                    
                }
            }
            
        }
    }
}

extension CharacteristicListViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.selectedService.characteristics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let characteristic = self.selectedService.characteristics[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = characteristic.characteristicType
        
        if characteristic.characteristicType == HMCharacteristicTypeName {
            cell.textLabel?.text = "Name : \(characteristic.value)"
        }
        
        if characteristic.characteristicType == HMCharacteristicTypeInUse {
            cell.textLabel?.text = "In Use : \(characteristic.value)"
        }
        
        if characteristic.characteristicType == HMCharacteristicTypePowerState {
            cell.textLabel?.text = "Power State : \(characteristic.value)"
        }
        
        return cell
    
    }
}



