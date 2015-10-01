//
//  RightTableViewCell.swift
//  AdvThreeTableViewInteract
//
//  Created by Tran Duc Hieu on 9/29/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class RightTableViewCell: UITableViewCell {

    @IBOutlet var rightImgView: UIImageView!
    
    @IBOutlet var rightLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
