//
//  TableViewCell.swift
//  ReviewTableView
//
//  Created by Tran Duc Hieu on 9/19/15.
//  Copyright © 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var lblCell: UILabel!
    @IBOutlet var imgCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
