//
//  tableView.swift
//  Demo2
//
//  Created by Austin Thao on 12/10/17.
//  Copyright © 2017 CST495. All rights reserved.
//

import UIKit
import Foundation

class tableView: UITableViewController{
    
    var name = String()
    var type = String()
    
    var list = ["Danny the Cat", "Bob the Horse", "Rob the Lion"]
    var refresher: UIRefreshControl!

    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return(list.count)
        
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        
        return(cell)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func userEnteredData(name: String, type: String, fur: Bool, sign: String){
        
        list.append(name + " the " + type)
        
        refresher.endRefreshing()
        tableView.reloadData()
        
    }
    

    
    

    
    
}
