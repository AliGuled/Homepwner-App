//
//  ItemStore.swift
//  Homepwner
//
//  Created by Guled Ali on 2/22/19.
//  Copyright © 2019 Guled Ali. All rights reserved.
//

import UIKit
class ItemStore {
    
    
    //Puttting all items into item
    var allItems = [Item]()
    
    //Creating the items
    func createItem() -> Item {
        
        let newItem = Item(random: true)
        allItems.append(newItem)
        
        return newItem
    }
    
    
    //Removing item from the array
    func removeItem(_ item: Item)  {
        if let index = allItems.index(of: item) {
            allItems.remove(at: index)
        }
    }
    //Movign the arrays
    func moveItem(from fromIndex: Int, to toIndex: Int) {
        
        if fromIndex == toIndex {
            return
        }
        let moveItem = allItems[fromIndex]
        
        allItems.remove(at: fromIndex)
        allItems.insert(moveItem, at: toIndex)
    }
    
    
}
