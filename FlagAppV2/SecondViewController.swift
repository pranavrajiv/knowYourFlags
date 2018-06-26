//
//  secondViewController.swift
//  FlagAppV2
//
//  Created by Pranav on 6/25/18.
//  Copyright © 2018 Pranav. All rights reserved.
//

import UIKit

//let flags = ["usa","india","india","usa","india","usa","india","usa","india","usa","india","usa","india","usa","india","usa","india","usa"]

var flags = [String]()


var counToFlagDict = [String: String]()


var indexOfFlag = 0

class secondViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        var data = readDataFromCSV(fileName: "countries", fileType: "csv")
        data = cleanRows(file: data!)
        let csvRows = csv(data: data!)
        
        //variable that makes sure that the header in the csv file is not included
        var count = 0
        
        for itemm in csvRows
        {
            //removes the headers
            if(count != 0)
            {
                //print(itemm,"\n\n")
                var index = itemm[0].index(of: ",")!
                var substr = itemm[0].prefix(upTo: index)
                flags.append(String(substr))
                
                //stores the name of the country
                let temp  = String(substr)
                
                var temp2 = itemm[0][index...]
                //remove the coma after the actual country name
                temp2.remove(at: temp2.startIndex)
                

                index = temp2.index(of: ",")!
                substr = temp2.prefix(upTo: index)
                counToFlagDict[temp] = String(substr)
                print("substr= ",counToFlagDict[temp])
            }
            count = 1
        }
        
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

    
    func readDataFromCSV(fileName:String, fileType: String)-> String!{
        guard let filepath = Bundle.main.path(forResource: fileName, ofType: fileType)
            else {
                return nil
        }
        do {
            var contents = try String(contentsOfFile: filepath, encoding: .utf8)
            contents = cleanRows(file: contents)
            return contents
        } catch {
            print("File Read Error for file \(filepath)")
            return nil
        }
    }

    
    
    
    func cleanRows(file:String)->String{
        var cleanFile = file
        cleanFile = cleanFile.replacingOccurrences(of: "\r", with: "\n")
        cleanFile = cleanFile.replacingOccurrences(of: "\n\n", with: "\n")
        //        cleanFile = cleanFile.replacingOccurrences(of: ";;", with: "")
        //        cleanFile = cleanFile.replacingOccurrences(of: ";\n", with: "")
        return cleanFile
    }
    
    func csv(data: String) -> [[String]]
    {
        var result: [[String]] = []
        let rows = data.components(separatedBy: "\n")
        for row in rows {
            let columns = row.components(separatedBy: ";")
            result.append(columns)
        }
        return result
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
        performSegue(withIdentifier: "segue", sender: self)
    }
}
