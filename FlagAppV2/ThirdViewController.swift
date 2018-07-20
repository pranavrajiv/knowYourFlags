//
//  ThirdViewController.swift
//  FlagAppV2
//
//  Created by Pranav on 6/25/18.
//  Copyright © 2018 Pranav. All rights reserved.
//  File that displays all the information of the country that the user clicked on

import UIKit

class ThirdViewController: UIViewController {
   
    
    //country flag image
    @IBOutlet weak var selectedImage: UIImageView!
    
  
    //country name
    @IBOutlet weak var selectedItem: UILabel!
    

    //country population
    @IBOutlet weak var popu: UILabel!
    
    //country capital
    @IBOutlet weak var capi: UILabel!
    
    //country currency
    @IBOutlet weak var curr: UILabel!
    
    //country income
    @IBOutlet weak var inco: UILabel!
    
    //country surface area
    @IBOutlet weak var area: UILabel!
    

    
    //country region
    @IBOutlet weak var regi: UILabel!
    
    //country language
    @IBOutlet weak var lang: UILabel!
    

    //function that sets the value to the filed as N/A if its empty
    func defaultValueSetter(_ texVal: String) -> String
    {
        if(texVal.count != 0)
        {
            return texVal
        }
        else
        {
            return "N/A"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        selectedImage.image = UIImage(named: counToFlagDictFiltered[flagsFiltered[indexOfFlag]]![0] + ".png")

        selectedItem.text = flagsFiltered[indexOfFlag]
        
        
        //format the numbers so that there are commas in them
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        
        
        
        if let myIntegerPopu = Int(counToFlagDictFiltered[flagsFiltered[indexOfFlag]]![1])
        {
            let myNumberPopu = NSNumber(value:myIntegerPopu)
            let formattedNumberPopu = numberFormatter.string(from: myNumberPopu)
            popu.text = formattedNumberPopu
            
            popu.text = defaultValueSetter(popu.text!)
        }
        
        capi.text = counToFlagDictFiltered[flagsFiltered[indexOfFlag]]![6]
        capi.text = defaultValueSetter(capi.text!)
        
        curr.text = counToFlagDictFiltered[flagsFiltered[indexOfFlag]]![4]
        curr.text = defaultValueSetter(curr.text!)
        
        
        inco.text = counToFlagDictFiltered[flagsFiltered[indexOfFlag]]![3]
        inco.text = defaultValueSetter(inco.text!)
        
        if let myIntegerArea = Int(counToFlagDictFiltered[flagsFiltered[indexOfFlag]]![5])
        {
            let myNumberArea = NSNumber(value:myIntegerArea)
            let formattedNumberArea = numberFormatter.string(from: myNumberArea)
            area.text = formattedNumberArea
            area.text = defaultValueSetter(area.text!)
        }
        
        //makes the label value displayed not limited to one line
        regi.text = counToFlagDictFiltered[flagsFiltered[indexOfFlag]]![2]
        regi.text = defaultValueSetter(regi.text!)
        regi.lineBreakMode = .byWordWrapping
        regi.numberOfLines = 0
        
        //makes the label value displayed not limited to one line
        lang.text = counToFlagDictFiltered[flagsFiltered[indexOfFlag]]![7]
        lang.text = defaultValueSetter(lang.text!)
        lang.lineBreakMode = .byWordWrapping
        lang.numberOfLines = 0

        
        
        
      
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
