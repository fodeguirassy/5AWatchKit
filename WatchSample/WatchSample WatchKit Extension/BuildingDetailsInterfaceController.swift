//
//  BuildingDetailsInterfaceController.swift
//  WatchSample WatchKit Extension
//
//  Created by Fodé Guirassy on 13/09/2018.
//  Copyright © 2018 Fodé Guirassy. All rights reserved.
//

import WatchKit
import Foundation


class BuildingDetailsInterfaceController: WKInterfaceController {
    
    class Context {
        
        let building: Building!
        weak var delegate : RemoveBuildingDelegate?
        
        init(buil : Building, delag : RemoveBuildingDelegate? = nil) {
            self.building = buil
            self.delegate = delag
        }
        
    }
    

    @IBOutlet var cityLabel: WKInterfaceLabel!
    @IBOutlet var priceLabel: WKInterfaceLabel!
    
    weak var delegate : RemoveBuildingDelegate?
    
    var building : Building! {
        didSet {
            self.redrawBuilding()
        }
    }
    
    func redrawBuilding() {
        self.cityLabel.setText("\(self.building.city)")
        self.priceLabel.setText("\(self.building.price ?? 0) €")
    }
    
    
    @IBAction func onRemoveCityClicked() {
        self.delegate?.didPressOnRemoveBuilding(controller: self, building: self.building)
    }
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)

        guard let obj  = context as? Context else {
            return
        }
        
        
        self.building = obj.building
        self.delegate = obj.delegate
        
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
