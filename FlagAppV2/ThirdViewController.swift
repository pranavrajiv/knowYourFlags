//
//  ThirdViewController.swift
//  FlagAppV2
//
//  Created by Pranav on 6/25/18.
//  Copyright © 2018 Pranav. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    
    @IBOutlet weak var selectedItem: UILabel!
    
    @IBOutlet weak var selectedImage: UIImageView!
    
    @IBOutlet weak var popu: UILabel!
    
    
    @IBOutlet weak var capi: UILabel!
    
    
    @IBOutlet weak var curr: UILabel!
    
    
    @IBOutlet weak var inco: UILabel!
    
    @IBOutlet weak var area: UILabel!
    
    @IBOutlet weak var regi: UILabel!
    
    
    @IBOutlet weak var lang: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        selectedImage.image = UIImage(named: counToFlagDictFiltered[flagsFiltered[indexOfFlag]]![0] + ".png")

        selectedItem.text = flagsFiltered[indexOfFlag]

        
        
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
        
        
        regi.text = counToFlagDictFiltered[flagsFiltered[indexOfFlag]]![2]

        regi.lineBreakMode = .byWordWrapping // notice the 'b' instead of 'B'
        regi.numberOfLines = 0
        
        lang.text = counToFlagDictFiltered[flagsFiltered[indexOfFlag]]![7]
        
        lang.lineBreakMode = .byWordWrapping // notice the 'b' instead of 'B'
        lang.numberOfLines = 0
       
        
        
        
        
        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
