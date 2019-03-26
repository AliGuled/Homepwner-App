//
//  CustomTextField.swift
//  Homepwner
//
//  Created by Guled Ali on 3/26/19.
//  Copyright © 2019 Guled Ali. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {

    //Called when the textfield is selected
    override func becomeFirstResponder() -> Bool {
        borderStyle = .bezel
        super.becomeFirstResponder()
        return true
    }
    
    //Called when the textfield is deselected
    override func resignFirstResponder() -> Bool {
        borderStyle = .roundedRect
        super.resignFirstResponder()
        return true
    }

}
