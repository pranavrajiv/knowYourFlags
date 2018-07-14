//
//  secondViewController.swift
//  FlagAppV2
//
//  Created by Pranav on 6/25/18.
//  Copyright © 2018 Pranav. All rights reserved.
//

import UIKit



var flagsFiltered = flags
var counToFlagDictFiltered = counToFlagDict

class secondViewController: UITableViewController,UISearchBarDelegate {
    @IBOutlet weak var srchBr: UISearchBar!
    
    @IBOutlet var tableViewing: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func viewDidAppear(_ animated: Bool) {
        flagsFiltered = flags
        counToFlagDictFiltered = counToFlagDict
        srchBr.text = ""
        tableViewing.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

   
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (flagsFiltered.count)
    }
  

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!  flagItemTableViewCell

        cell.myLabel.text =  flagsFiltered[indexPath.row]
        cell.myImage.image = UIImage(named: counToFlagDictFiltered[flagsFiltered[indexPath.row]]![0] + ".png")
        
        
        
        
        // Configure the cell...

        return cell
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        indexOfFlag = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }
    
    
    
    func searchBar(_ searchBar: UISearchBar,textDidChange searchText: String)
    {
        
     
        flagsFiltered = flags
        counToFlagDictFiltered = counToFlagDict
        
        if(searchText != "")
        {
            flagsFiltered = flags.filter({fla -> Bool in
            return fla.contains(searchText)
            })
        
            //print("filteredtFlags = ",flagsFiltered)
            
            
            for (ite,_) in counToFlagDict
            {
                if !flagsFiltered.contains(ite)
                {
                    counToFlagDictFiltered.removeValue(forKey: ite)
                }
            }
          
        }
     
            
        tableViewing.reloadData()
    }
    
    
    
    
}
