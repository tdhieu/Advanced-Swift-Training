//
//  MainTableViewCell.swift
//  ExpenseManager
//
//  Created by Tran Duc Hieu on 1/4/16.
//  Copyright © 2016 Tran Duc Hieu. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var myTitle: UILabel!
    
    @IBOutlet weak var myDetail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
