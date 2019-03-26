//
//  DetailViewController.swift
//  Homepwner
//
//  Created by Guled Ali on 3/24/19.
//  Copyright © 2019 Guled Ali. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UITextFieldDelegate {

    //TextField and label outlets
    @IBOutlet weak var nameField: CustomTextField!
    @IBOutlet weak var serialField: CustomTextField!
    @IBOutlet weak var valueField: CustomTextField!
    @IBOutlet weak var dateLabel: UILabel!
    
    var item: Item! {
        didSet {
            navigationItem.title = item.name
        }
    }
    
    //creating number formater
    var formater: NumberFormatter = {
        let formater = NumberFormatter()
        formater.numberStyle = .decimal
        formater.minimumFractionDigits = 2
        formater.maximumFractionDigits = 2
        return formater
    }()
    
    //creating date formater
    var dateFormater: DateFormatter = {
        let formater = DateFormatter()
        formater.dateStyle = .medium
        formater.timeStyle = .none
        return formater
        
    }()

    //loading the fields with data when view is about appear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        nameField.text = item.name
        serialField.text = item.serialNumber
       valueField.text =  formater.string(from: NSNumber(value: item.valueInDollars))
        dateLabel.text = dateFormater.string(from: item.dateCreated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    //when the return button is pressed the keyboard dismiss
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //Changes the date created to custom date
    @IBAction func changeDate(_ sender: UIButton) {
        let datePickerController = DatePickerViewController()
        datePickerController.item = item
        self.navigationController?.pushViewController(datePickerController, animated: true)
    }
    
    //Dismiss the keybaord when the superview is tapped
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    //When the view is dismissed it resets the textfield 
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        view.endEditing(true)
        
        //Save changes to item
        item.name = nameField.text ?? ""
        item.serialNumber = serialField.text
        
        if let valueText = valueField.text, let value = formater.number(from: valueText) {
            item.valueInDollars = value.intValue
        } else {
            item.valueInDollars = 0
        }
        
    }
    


}
