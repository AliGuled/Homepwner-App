//
//  Item.swift
//  Homepwner
//
//  Created by Guled Ali on 2/21/19.
//  Copyright © 2019 Guled Ali. All rights reserved.
//

import UIKit

class  Item: NSObject {
    
    //The data vars
    var name: String
    var valueInDollars: Int
    var serialNumber: String?
    var dateCreated: Date
    
    //initalizing the data vars
    init(name: String, serialNumber: String?, valueInDollars: Int) {
        self.name = name
        self.valueInDollars = valueInDollars
        self.serialNumber = serialNumber
        self.dateCreated = Date()
        
        super.init()
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
