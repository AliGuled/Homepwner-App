//
//  Item.swift
//  Homepwner
//
//  Created by Guled Ali on 2/21/19.
//  Copyright © 2019 Guled Ali. All rights reserved.
//

import UIKit

class  Item: NSObject,NSCoding {
   

    
    //The data vars
    var name: String
    var valueInDollars: Int
    var serialNumber: String?
    var dateCreated: Date
    let itemKey: String
    
    //initalizing the data vars
    init(name: String, serialNumber: String?, valueInDollars: Int) {
        self.name = name
        self.valueInDollars = valueInDollars
        self.serialNumber = serialNumber
        self.dateCreated = Date()
        self.itemKey = UUID().uuidString
        
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: constants.name)
        aCoder.encode(dateCreated, forKey: constants.dateCreated)
        aCoder.encode(itemKey,forKey: constants.itemKey)
        aCoder.encode(serialNumber, forKey: constants.serialNumber)
        aCoder.encode(valueInDollars, forKey: constants.valueInDollars)
    }
    
    required  init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: constants.name) as! String
        dateCreated = aDecoder.decodeObject(forKey: constants.dateCreated) as! Date
        itemKey = aDecoder.decodeObject(forKey: constants.itemKey) as! String
        serialNumber = aDecoder.decodeObject(forKey: constants.serialNumber) as! String?
        valueInDollars = aDecoder.decodeInteger(forKey: constants.valueInDollars)
        
        super.init()
        
    }
    
    struct constants {
        static let name = "name"
        static let dateCreated = "dateCreated"
        static let itemKey = "itemKey"
        static let serialNumber = "serialNumber"
        static let valueInDollars = "valueIndollars"
    }
    
    //Convenient inilizer
    convenience init(random: Bool = false) {
        if random {
            let adjectives = ["Fluffy", "Rusty", "Shiny"]
            let nouns = ["Bear", "Spork", "Mac"]
            
            let idx = arc4random_uniform(UInt32(adjectives.count))
            let randomAdjectives = adjectives[Int(idx)]
            let randomNoun = nouns[Int(idx)]
            
            let randomName = "\(randomAdjectives) \(randomNoun)"
            let randomValue = Int(arc4random_uniform(100))
            
            let randomSerialNumber = UUID().uuidString.components(separatedBy: "-").first!
            
            self.init(name: randomName, serialNumber: randomSerialNumber, valueInDollars: randomValue)
        } else {
            self.init(name: "", serialNumber: nil, valueInDollars: 0)
            
        }
    }
    
   
    
}
