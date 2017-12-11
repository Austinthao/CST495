//
//  ViewController.swift
//  Demo2
//
//  Created by Austin Thao on 12/9/17.
//  Copyright © 2017 CST495. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var type: UITextField!
    
    @IBAction func next(_ sender: Any) {
        
        if name.text != "" {
            performSegue(withIdentifier: "nextForm", sender: self)
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let secondController = segue.destination as! animalVerification
        
        secondController.animalName = name.text!
        secondController.animalType = type.text!
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

