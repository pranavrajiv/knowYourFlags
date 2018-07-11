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

var predictionLabel = "USA"

class FirstViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    @IBOutlet weak var picTaken: UIImageView!
    
    @IBOutlet weak var detectLabel: UILabel!
    @IBOutlet weak var knowMorebuttonSetProp: UIButton!
    
    @IBAction func knowMoreButton(_ sender: Any) {
        setIndexOfFlag(String(predictionLabel))
        knowMorebuttonSetProp.backgroundColor = .yellow
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         //detectLabel.text = "Hello"
        
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
                
                //for parsing the languages
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
        
        
        
        
        
        
        let url = URL(string: "file:///Users/pranav/Desktop/italy.jpg")
        let data = try? Data(contentsOf: url!)
        
        let image = UIImage(data : data!)
        
        
        
        
        //guard let image = info["UIImagePickerControllerOriginalImage"] as? UIImage else {
        //  return
        //}
        
        processImage(image!)
    }
    
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
        
        
        
        picTaken.image = imageTake
        detectLabel.text = "\(predictionLabel) - \(converted) %"
        
        
        knowMorebuttonSetProp.backgroundColor = .yellow
        knowMorebuttonSetProp.setTitle("Know more about \(predictionLabel) ?", for: .normal)
        
        //print("predictionLabel = ",predictionLabel)
        //print("result.classLabel = ",result.classLabel)
        
    }
    
    
    
    func setIndexOfFlag(_ flagName: String)
    {
        
        var counter = 0
        
        for item in flags
        {
            print("item.lowercased() = ", item.lowercased())
            print("result.classLabel.lowercased() = ", flagName.lowercased())
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

