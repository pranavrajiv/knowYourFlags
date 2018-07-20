//
//  FirstViewController.swift
//  FlagAppV2
//
//  Created by Pranav on 6/24/18.
//  Copyright © 2018 Pranav. All rights reserved.
//  This file takes care of the loading the csv data of the countries and the first page that you see when the app opens up
//

import UIKit

//array of strings that stores the names of all the flags
var flags = [String]()

//dictionary which connects the name of the flags to an array of strings that stores different things about the country
var counToFlagDict = [String: [String]]()

//Indexing variable used to see what flag in the array of flags the user clicked from the table of flags or based on the image taken by the user
var indexOfFlag = 0


//variable that stores the name of the country
var predictionLabel = "India"

class FirstViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    //the picture taken
    @IBOutlet weak var picTaken: UIImageView!
    
    //the label of the picture taken
    @IBOutlet weak var detectLabel: UILabel!
    
    //button that lets you know more about the flag
    @IBOutlet weak var knowMorebuttonSetProp: UIButton!
    
    @IBAction func knowMoreButton(_ sender: Any) {
        setIndexOfFlag(String(predictionLabel))
        knowMorebuttonSetProp.backgroundColor = .yellow
    }
    
    //called every time the view is about to appear so that counToFlagDictFiltered and flagsFiltered gets updated to prevent the app from picking the wrong indexes due to the changes that might have been made by the search bar in the second view controller
    override func viewWillAppear(_ animated: Bool) {
        flagsFiltered = flags
        counToFlagDictFiltered = counToFlagDict
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //stores data from the CSV file about all the countries
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
               
                //print("\nitemm[0]",itemm[0])
                var index = itemm[0].index(of: ",")!
                var substr = itemm[0].prefix(upTo: index)
                flags.append(String(substr))
                
                //stores the name of the country
                let temp  = String(substr)
                
                //capture the rest of the information from the file
               
               var temp2 = itemm[0][index...]
            
                for _ in 1...7
                {
                    
                    //remove the coma after the actual country name
                    temp2.remove(at: temp2.startIndex)
                    index = temp2.index(of: ",")!
        
                    substr = temp2.prefix(upTo: index)
                    tempList.append(String(substr))
                    temp2 = temp2[index...]
                
                
                }
                
                //for parsing the languages (the last column in each row)
                temp2.remove(at: temp2.startIndex)
                if temp2.count > 0
                {
                    temp2.remove(at: temp2.startIndex)
                    temp2.removeLast()
                }
                tempList.append(String(temp2))
            
                counToFlagDict[temp] = tempList
                
            }
            count = 1
            
        }
    }
    
    
    
    
    
    //function that lets you select an image from the gallery or from the camera
    @IBAction func selectImageButton(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let imagePickerView = UIImagePickerController()
        imagePickerView.delegate = self
        
        alert.addAction(UIAlertAction(title: "Choose Image", style: .default) { _ in
            imagePickerView.sourceType = .photoLibrary
            self.present(imagePickerView, animated: true, completion: nil)
        })
        
        alert.addAction(UIAlertAction(title: "Take Image", style: .default) { _ in
            imagePickerView.sourceType = .camera
            self.present(imagePickerView, animated: true, completion: nil)
        })
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
        dismiss(animated: true, completion: nil)
  
       // let url = URL(string: "file:///Users/pranav/Desktop/IMG_5440.JPG")
       // let data = try? Data(contentsOf: url!)
        
        //let image = UIImage(data : data!)
      
        guard let image = info["UIImagePickerControllerOriginalImage"] as? UIImage else {
          return
        }
        
        processImage(image)
    }
    
    
    
    //fucntion that call the Core ML model to predict the name of the country the flag is from
    func processImage(_ imageTake: UIImage) {
        let model = flag()
        let size = CGSize(width: 224, height: 224)
        
        guard let buffer = imageTake.resize(to: size)?.pixelBuffer() else {
            fatalError("Scaling or converting to pixel buffer failed!")
        }
        
        guard let result = try? model.prediction(Placeholder__0: buffer) else {
            fatalError("Prediction failed!")
        }
        
        let confidence = result.final_result__0["\(result.classLabel)"]! * 100.0
        let converted = String(format: "%.2f", confidence)
        
        
        if result.classLabel == "united states of america and united states minor outlying islands"
        {
            predictionLabel = "united states of america"
        }
        else
        {
            predictionLabel = result.classLabel
        }
        
        setIndexOfFlag(String(predictionLabel))
        
        picTaken.image = imageTake
        detectLabel.text = "\(flags[indexOfFlag]) - \(converted) %"
        
        
        knowMorebuttonSetProp.backgroundColor = .yellow
        
        knowMorebuttonSetProp.setTitle("  Want to know more about \(flags[indexOfFlag]) ?  ", for: .normal)
        
        knowMorebuttonSetProp.sizeToFit()
        knowMorebuttonSetProp.layer.cornerRadius =  10
        knowMorebuttonSetProp.clipsToBounds = true
        
        
        
        flagsFiltered = flags
        counToFlagDictFiltered = counToFlagDict

        
    }
    
    
    //Function used to set what flag in the array of flags the user clicked from the table of flags or based on the image taken by the user
    func setIndexOfFlag(_ flagName: String)
    {
        var counter = 0
        for item in flags
        {

            if(item.lowercased()  == flagName.lowercased() )
            {
                indexOfFlag = counter
                break;
            }
            counter = counter + 1
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //read data from CSV file
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
    
    //clean the rows of the csv data
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

