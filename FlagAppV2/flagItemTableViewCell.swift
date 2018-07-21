//
//  flagItemTableViewCell.swift
//  FlagAppV2
//
//  Created by Pranav on 6/25/18.
//  Copyright © 2018 Pranav. All rights reserved.
//  The cell information in the secondViewController's table view
//

import UIKit

class flagItemTableViewCell: UITableViewCell {

    //country name
    @IBOutlet weak var myLabel: UILabel!
    
    //country flag image
    @IBOutlet weak var myImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        myLabel.lineBreakMode = .byWordWrapping
        myLabel.numberOfLines = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
