//
//  animalVerification.swift
//  Demo2
//
//  Created by Austin Thao on 12/9/17.
//  Copyright © 2017 CST495. All rights reserved.
//

import UIKit
import ObjectiveC
import os_object

@objc protocol SendDataDelegate {
    
    func userEnteredData(name: String, type: String)
    @objc optional var getRandom: String { get set }
}


class animalVerification: UIViewController {
    
    @IBOutlet weak var signiture: UITextField!
    @IBOutlet weak var hasFur: UISegmentedControl!
    
    var animalName = String()
    var animalType = String()
    
    var delegate: SendDataDelegate? = nil
    
    
    @IBAction func unWind(_ sender: Any) {
        
        if delegate != nil {
            if animalName != "" && animalType != "" {
                delegate?.userEnteredData(name: animalName, type: animalType)
            }
        }
        
        self.navigationController?.popToRootViewController(animated: false)
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}








