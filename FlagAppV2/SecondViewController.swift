//
//  secondViewController.swift
//  FlagAppV2
//
//  Created by Pranav on 6/25/18.
//  Copyright © 2018 Pranav. All rights reserved.
//

import UIKit

let flags = ["usa","india","india","usa","india","usa","india","usa","india","usa","india","usa","india","usa","india","usa","india","usa"]
var indexOfFlag = 0

class secondViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //loadSampleFlags()
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        return (flags.count)
    }
  

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!  flagItemTableViewCell

       cell.myLabel.text =  flags[indexPath.row]
        
        // Configure the cell...

        return cell
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        indexOfFlag = indexPath.row
        print("indexOfFlag = ", indexOfFlag)
        performSegue(withIdentifier: "segue", sender: self)
    }
}
