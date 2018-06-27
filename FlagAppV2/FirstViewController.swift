//
//  FirstViewController.swift
//  FlagAppV2
//
//  Created by Pranav on 6/24/18.
//  Copyright © 2018 Pranav. All rights reserved.
//

import UIKit

var flags = [String]()

var counToFlagDict = [String: [String]]()

var indexOfFlag = 0


class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var data = readDataFromCSV(fileName: "countries", fileType: "csv")
        data = cleanRows(file: data!)
        let csvRows = csv(data: data!)
        
        //variable that makes sure that the header in the csv file is not included
        var count = 0
        
        for itemm in csvRows
        {
            
            var tempList = [String]()
            //removes the headers
            if(count != 0)
            {
                //print(itemm,"\n\n")
                var index = itemm[0].index(of: ",")!
                var substr = itemm[0].prefix(upTo: index)
                flags.append(String(substr))
                
                //stores the name of the country
                let temp  = String(substr)
                
                //capture the rest of the information from the file
               
               var temp2 = itemm[0][index...]
               //print("temp2 = ",temp2)
                for _ in 1...7
                {
                    
                    //remove the coma after the actual country name
                    temp2.remove(at: temp2.startIndex)
                    index = temp2.index(of: ",")!
        
                    substr = temp2.prefix(upTo: index)
                    tempList.append(String(substr))
                    temp2 = temp2[index...]
                
                
                }
                
                //for parsing the location
                temp2.remove(at: temp2.startIndex)
                tempList.append(String(temp2))
                
                
                counToFlagDict[temp] = tempList
                
                
            }
            count = count + 1
            //if(count == 2)
            //{
                //break
            //}
        }
        
        
        
        
        
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    
    
    
    
    
    
    

}

