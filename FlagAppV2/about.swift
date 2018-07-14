//
//  about.swift
//  FlagAppV2
//
//  Created by Pranav on 7/12/18.
//  Copyright © 2018 Pranav. All rights reserved.
//  File that contains the text contained in the "about" tab

import UIKit

class about: UIViewController {
    @IBOutlet weak var aboutText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //text in the "about" tab
        aboutText.text = "This is an IOS app that has a Core ML machine learning model in the backend trained using Tensorflow which help you identify flags of every country in the world from pictures of flags taken from your camera or the once present in your camera roll."
        
        aboutText.lineBreakMode = .byWordWrapping
        aboutText.numberOfLines = 0
        
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
