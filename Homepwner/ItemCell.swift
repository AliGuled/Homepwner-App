//
//  ItemCell.swift
//  Homepwner
//
//  Created by Guled Ali on 2/25/19.
//  Copyright © 2019 Guled Ali. All rights reserved.
//

import UIKit
class ItemCell: UITableViewCell {
    
    //setting the lable to adjust font size
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.adjustsFontSizeToFitWidth = true
        serialLabel.adjustsFontSizeToFitWidth = true
        valueLabel.adjustsFontSizeToFitWidth = true
    }
    
    //Custom label outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var serialLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    
}
