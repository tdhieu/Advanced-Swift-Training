//
//  ViewController.swift
//  AdvContainerViewController
//
//  Created by Tran Duc Hieu on 1/13/16.
//  Copyright © 2016 Tran Duc Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    var firstViewController:UIViewController?
    var secondViewController:UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnFirstClick(sender: AnyObject) {
    }
    
    @IBAction func btnSecondClick(sender: AnyObject) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

