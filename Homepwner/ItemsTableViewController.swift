//
//  ItemViewController.swift
//  Homepwner
//
//  Created by Guled Ali on 2/21/19.
//  Copyright © 2019 Guled Ali. All rights reserved.
//

import UIKit

class ItemsTableViewController: UITableViewController {
    
    //Connecting to our model
    var itemStore: ItemStore!
    var items: Item!
    //id for cell
    let identifier = "ItemCell"

    //Out let for labels
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var serialNumber: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    //view did load adjusting status bar frame and row height
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        tableView.rowHeight = 65
    }
    
    //Adding new row to the table view
        @IBAction func addNewItem(_ sender: UIButton) {
        
        //Make a new index path for the 0th section, last row
        let newItem = itemStore.createItem()
        
        if let index = itemStore.allItems.index(of: newItem) {
            let indexPath = IndexPath(row: index, section: 0)
        
        // Insert this new row itto the table
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    }
    //Togggleing the edit button between edit and done
    @IBAction func toggleEditingMode(_ sender: UIButton) {
        
        if isEditing{
            
            sender.setTitle("Edit", for: .normal)
            setEditing(false, animated: true)
        } else {
            sender.setTitle("Done", for: .normal)
            setEditing(true, animated:  true)
        }
    }

    
    
    //Letting the nunbmer of rows to be the array count
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return itemStore.allItems.count
    }
    
        
    
    //Popluating our table view rows with name,serial nunmber and value dollars
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ItemCell
        let item = itemStore.allItems[indexPath.row]
        cell.nameLabel.text = item.name
        cell.serialLabel.text = item.serialNumber
        cell.valueLabel.text = "\(item.valueInDollars)"
        
        if item.valueInDollars > 50 {
            
            cell.valueLabel.textColor = .red
        } else {
            cell.valueLabel.textColor = .green
        }
        
        return cell
    }
    
    //Changing the delete confirmation title to 'remove'
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Remove"
    }
    
    //preventing the table view from reoder
    override func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        if proposedDestinationIndexPath.row == 0 {
            return sourceIndexPath
        } else {
            return proposedDestinationIndexPath
        }
    }
    
   
    //Deleting rows with confirmation action sheet.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let item = itemStore.allItems[indexPath.row]
            let title = "Delete \(item)?"
            
            let message = "Are you sure you want to delete this item"
            
            let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            ac.addAction(cancelAction)
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { (action) in
                self.itemStore.removeItem(item)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            ac.addAction(deleteAction)
            
            present(ac, animated: true, completion: nil)
        }
    }
    
    //reorder the tableview
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
}
