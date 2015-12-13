//
//  ViewController.swift
//  StrutsProblem
//
//  Created by Tran Duc Hieu on 12/13/15.
//  Copyright © 2015 Tran Duc Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var topLeftView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var topRightView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        if UIDevice.currentDevice().orientation == UIDeviceOrientation.LandscapeLeft || UIDevice.currentDevice().orientation == UIDeviceOrientation.LandscapeRight {
            
            var rect = topLeftView.frame
            rect.size.width = 254
            rect.size.height = 130
            topLeftView.frame = rect
            
            rect = topRightView.frame
            rect.origin.x = 294
            rect.size.width = 254
            rect.size.height = 130
            topRightView.frame = rect
            
            rect = bottomView.frame
            rect.origin.y = 170
            rect.size.width = 528
            rect.size.height = 130
            bottomView.frame = rect
            
        } else {
            
            var rect = topLeftView.frame
            rect.size.width = 130
            rect.size.height = 254
            topLeftView.frame = rect
            
            rect = topRightView.frame
            rect.origin.x = 170
            rect.size.width = 130
            rect.size.height = 254
            topRightView.frame = rect
            
            rect = bottomView.frame
            rect.origin.y = 295
            rect.size.width = 280
            rect.size.height = 254
            bottomView.frame = rect
        }
    }

}

