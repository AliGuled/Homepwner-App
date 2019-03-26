//
//  DatePickerViewController.swift
//  Homepwner
//
//  Created by Guled Ali on 3/26/19.
//  Copyright © 2019 Guled Ali. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
    
    var item: Item! //Subclass of Item
    
    var datePicker = UIDatePicker()//Created date picker view
    
    //Loading the view
        override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        self.view = view
        
    }
    //loading the data when view is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Date Created"
        
        datePicker.datePickerMode = .date
        datePicker.date = item.dateCreated
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(datePicker)
        
        datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        datePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    //Sets the picker to dateCreate
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        item.dateCreated = datePicker.date
    }
    


}
