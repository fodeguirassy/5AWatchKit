//
//  RemoveBuildingProtocole.swift
//  WatchSample WatchKit Extension
//
//  Created by Fodé Guirassy on 13/09/2018.
//  Copyright © 2018 Fodé Guirassy. All rights reserved.
//

import Foundation

protocol RemoveBuildingDelegate : NSObjectProtocol {
    func didPressOnRemoveBuilding(controller : BuildingDetailsInterfaceController, building : Building)
}

