//
//  ViewController.swift
//  Demo1
//
//  Created by Austin THao on 9/13/17.
//  Copyright © 2017 Austin Thao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func Clickme(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "import UIKit", message: "var feedback = null", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
        
    }
    
    @IBOutlet weak var testLabel: UILabel!
    
    func change(str: String){
        
        testLabel.text = str
        
    }
    
    
    @IBAction func feedBackAlert(_ sender: UIButton) {
        
        
        
        let feedBack = UIAlertController(title: "Enter Text", message: "Enter some text below",
            preferredStyle: .alert);
        
        
        feedBack.addTextField { (textField) in textField.text = "Some default text"}
        
        
        
        feedBack.addAction(UIAlertAction(title: "Submit", style: .default, handler: { action in let textField = feedBack.textFields![0]
            
            self.testLabel.text = textField.text
            
            
        }))
        

        present(feedBack, animated: true, completion: nil)

        
    }

}
