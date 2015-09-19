//
//  2ndViewScreen.swift
//  ReviewTableView
//
//  Created by Tran Duc Hieu on 9/19/15.
//  Copyright © 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class _ndViewScreen: UIViewController {

    @IBOutlet var lblTitle: UILabel!
    var param:NSUserDefaults = NSUserDefaults()
    var selectedCellContent:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedCellContent = param.objectForKey("param") as! String
        lblTitle.text = selectedCellContent
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
