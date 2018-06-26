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
    override func viewDidLoad() {
        super.viewDidLoad()

        selectedItem.text = flags[indexOfFlag]
        selectedImage.image = UIImage(named: counToFlagDict[flags[indexOfFlag]]! + ".png")
        
        
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
