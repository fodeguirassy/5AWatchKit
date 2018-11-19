//
//  Building.swift
//  WatchSample WatchKit Extension
//
//  Created by Fodé Guirassy on 13/09/2018.
//  Copyright © 2018 Fodé Guirassy. All rights reserved.
//

import Foundation

class Building : CustomStringConvertible, Equatable {
    
    static func == (lhs: Building, rhs: Building) -> Bool {
        return lhs.description == rhs.description
    }
    
    
    
    let address : String
    let city : String
    let floor : Int?
    let price : Double?
    let zip : String
    
    init(address : String, city : String, zip : String, floor : Int? = nil, price: Double?  = nil) {
        self.address = address
        self.city = city
        self.zip = zip
        self.floor = floor
        self.price = price
    }
    
    convenience init?(data : [String: Any]) {
        
        guard let address = data["address"] as? String,
              let city = data["city"] as? String,
              let zip = data["zip"] as? String
        else {
            return nil
        }
        
        self.init(address: address, city: city, zip: zip,
                  floor : data["floor"] as? Int,
                  price : data["price"] as? Double)
    }
    
    var description: String {
        var fields = [
        "address : \(self.address)",
        "city : \(self.city)",
        "zip : \(self.zip)"
        ]
        
        if let fl =  self.floor {
            fields.append("floor : \(fl)")
        }
        if let p =  self.price {
            fields.append("price : \(p)")
        }
        
        return "Building : [\(fields.joined(separator : ", "))]"
    }
    
}
