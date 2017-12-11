//
//  TableViewController.swift
//  Demo2
//
//  Created by Austin Thao on 12/10/17.
//  Copyright © 2017 CST495. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UISearchBarDelegate, SendDataDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var animalName = String()
    var animalType = String()
    
    
    @objc func userEnteredData(name: String, type: String) {
        
        if(name != "" && type != ""){
            
            animalName = name
            animalType = type
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let test: animalVerification = segue.destination as! animalVerification
        test.delegate = self
    }
    

    var list = ["Danny the Cat", "Bob the Horse", "Rob the Lion"]
    var filteredList = [String]()
    var searching:Bool! = false
    
    
    
    
    
    var refresher: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refresher = UIRefreshControl()
        refresher.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refresher.addTarget(self, action: #selector(TableViewController.populate), for: UIControlEvents.valueChanged)
        tableView.addSubview(refresher)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if searching == true {
            
            return filteredList.count
        }
        else {
            return list.count
        }
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
        if searching == true {
            cell.textLabel?.text = filteredList[indexPath.row]
            
        }
        
        else {
            
            cell.textLabel?.text = list[indexPath.row]
            
        }
        

        return cell
    }
    
    
    @objc func populate(){
        
        let getRandom: String = "Happy the cat"
        
            list[0] = "Updated"
            list[1] = "The"
            list[2] = "List"
        
        list.append(getRandom)
        
        refresher.endRefreshing()
        tableView.reloadData()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredList = list.filter({ (text) ->
            Bool in
            let tmp: NSString = text as NSString
            let range = tmp.range(of: searchText, options:
                NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
        })
        if(filteredList.count == 0){
            searching = false;
        }
        else {
            searching = true;
        }
        self.tableView.reloadData()
        
    }
    



}
