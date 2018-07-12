//
//  about.swift
//  FlagAppV2
//
//  Created by Pranav on 7/12/18.
//  Copyright © 2018 Pranav. All rights reserved.
//

import UIKit

class about: UIViewController {
    @IBOutlet weak var aboutText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        aboutText.text = "This is an IOS app that has Core ML machine learning model on the backend trained using tensorflow which help you identify flags of every country in the world using pictures taken of the flag from your camera or the once present in the camera roll."
        
        aboutText.lineBreakMode = .byWordWrapping // notice the 'b' instead of 'B'
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
