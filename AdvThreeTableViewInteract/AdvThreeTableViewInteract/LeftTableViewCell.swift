//
//  LeftTableViewCell.swift
//  AdvThreeTableViewInteract
//
//  Created by Tran Duc Hieu on 9/29/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class LeftTableViewCell: UITableViewCell {

    @IBOutlet var leftImgView: UIImageView!
    
    @IBOutlet var leftLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
