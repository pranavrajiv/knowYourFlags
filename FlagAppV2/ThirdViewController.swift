//
//  ThirdViewController.swift
//  FlagAppV2
//
//  Created by Pranav on 6/25/18.
//  Copyright © 2018 Pranav. All rights reserved.
//  File that displays all the information of the country that the user clicked on

import UIKit

class ThirdViewController: UIViewController {

    //country name
    @IBOutlet weak var selectedItem: UILabel!
    
    //country flag image
    @IBOutlet weak var selectedImage: UIImageView!
    /*
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
    
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()

        selectedImage.image = UIImage(named: counToFlagDictFiltered[flagsFiltered[indexOfFlag]]![0] + ".png")

        selectedItem.text = flagsFiltered[indexOfFlag]
/*
        
        //format the numbers so that there are commas in them
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        
        
        
        if let myIntegerPopu = Int(counToFlagDictFiltered[flagsFiltered[indexOfFlag]]![1])
        {
            let myNumberPopu = NSNumber(value:myIntegerPopu)
            let formattedNumberPopu = numberFormatter.string(from: myNumberPopu)
            popu.text = formattedNumberPopu
        }
        
        capi.text = counToFlagDictFiltered[flagsFiltered[indexOfFlag]]![6]
        
        curr.text = counToFlagDictFiltered[flagsFiltered[indexOfFlag]]![4]
        
        inco.text = counToFlagDictFiltered[flagsFiltered[indexOfFlag]]![3]
        
        if let myIntegerArea = Int(counToFlagDictFiltered[flagsFiltered[indexOfFlag]]![5])
        {
            let myNumberArea = NSNumber(value:myIntegerArea)
            let formattedNumberArea = numberFormatter.string(from: myNumberArea)
            area.text = formattedNumberArea
        }
        
        //makes the label value displayed not limited to one line
        regi.text = counToFlagDictFiltered[flagsFiltered[indexOfFlag]]![2]
        regi.lineBreakMode = .byWordWrapping
        regi.numberOfLines = 0
        
        //makes the label value displayed not limited to one line
        lang.text = counToFlagDictFiltered[flagsFiltered[indexOfFlag]]![7]
        lang.lineBreakMode = .byWordWrapping
        lang.numberOfLines = 0
     */

    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
