//
//  secondViewController.swift
//  FlagAppV2
//
//  Created by Pranav on 6/25/18.
//  Copyright © 2018 Pranav. All rights reserved.
//  File that contains the seach bar and also the tabular display of the differnt countries in the world

import UIKit


//copy of the flags string which is used when it is needed to filter out some countries based on the search string in the search bar
var flagsFiltered = flags

//copy of the counToFlagDict dictionary which is used when it is needed to filter out some countries based on the search string in the search bar
var counToFlagDictFiltered = counToFlagDict

class secondViewController: UITableViewController,UISearchBarDelegate {
    
    //searchbar
    @IBOutlet weak var srchBr: UISearchBar!
    
    //tablular view
    @IBOutlet var tableViewing: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    //called every time the view is about to appear so that counToFlagDictFiltered and flagsFiltered gets updated to prevent the app from picking the wrong indexes due to the changes that might have been made by the search bar in the second view controller
    override func viewWillAppear(_ animated: Bool) {
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
        return cell
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        indexOfFlag = indexPath.row
        
        //performs a segue to the thirdViewController
        performSegue(withIdentifier: "segue", sender: self)
    }
    
    
    //search bar function to filter out the countries
    func searchBar(_ searchBar: UISearchBar,textDidChange searchText: String)
    {
        
        flagsFiltered = flags
        counToFlagDictFiltered = counToFlagDict
        
        // updating the flagsFiltered and counToFlagDictFiltered based on the search string
        if(searchText != "")
        {
            flagsFiltered = flags.filter({fla -> Bool in return fla.contains(searchText)})
            
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
