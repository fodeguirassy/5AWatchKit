//
//  ListInterfaceController.swift
//  WatchSample WatchKit Extension
//
//  Created by Fodé Guirassy on 10/09/2018.
//  Copyright © 2018 Fodé Guirassy. All rights reserved.
//

import WatchKit
import Foundation


class ListInterfaceController: WKInterfaceController {
    
    
    @IBOutlet var buildingsTable: WKInterfaceTable!
    var buildings : [Building]! {
        didSet {
            self.redrawBuildings()
        }
    }
    
    
    func fetchBuildings() {
        
        guard let url  = URL(string: "http://10.33.1.191:54321/") else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let d = data,
                let obj = try? JSONSerialization.jsonObject(with: d, options: .allowFragments),
                
                let rawBuildings = obj as? [[String: Any]] else {
                    return
                }
            
            self.buildings = rawBuildings.compactMap({ (b) in
                return Building(data: b)
            })
            
        }
        
        task.resume()
    }
    
    func redrawBuildings() {
        self.buildingsTable.setNumberOfRows(self.buildings.count, withRowType: "Building")
        for i in 0 ..< self.buildings.count {
            if let buildingRowController = self.buildingsTable.rowController(at: i) as? BuildingRowController {
                //schoolRowController.titleLabel.setText(self.buildings[i].city)
                // schoolRowController.picture.setImage(UIImage(named: "pic.png"))
                buildingRowController.draw(building: self.buildings[i])
            }
        }
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        if(table == buildingsTable) {
            let context = BuildingDetailsInterfaceController.Context(buil: self.buildings[rowIndex], delag : self)

            self.pushController(withName: "buildingDetails", context: ["building" : context])
            
        }
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        self.fetchBuildings()
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

extension ListInterfaceController : RemoveBuildingDelegate {
    
    func didPressOnRemoveBuilding(controller: BuildingDetailsInterfaceController, building: Building){
        let b = self.buildings.index(of: building)
        self.buildings.remove(at: b!)
        
    }
}
