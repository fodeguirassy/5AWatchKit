//
//  SchoolRowController.swift
//  WatchSample WatchKit Extension
//
//  Created by Fodé Guirassy on 10/09/2018.
//  Copyright © 2018 Fodé Guirassy. All rights reserved.
//

import WatchKit

class BuildingRowController : NSObject {
    @IBOutlet var titleLabel : WKInterfaceLabel!
    @IBOutlet var price: WKInterfaceLabel!
}

extension BuildingRowController {
    func draw(building: Building) {
        self.titleLabel.setText("\(building.address) \(building.zip) \(building.city)")
        self.price.setText("\(building.price ?? 0) €")
    }
}
