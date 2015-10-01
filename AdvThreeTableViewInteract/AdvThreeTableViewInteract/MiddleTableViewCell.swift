//
//  MiddleTableViewCell.swift
//  AdvThreeTableViewInteract
//
//  Created by Tran Duc Hieu on 9/29/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class MiddleTableViewCell: UITableViewCell {

    @IBOutlet var middleLabel: UILabel!
    
    @IBOutlet var middleImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
