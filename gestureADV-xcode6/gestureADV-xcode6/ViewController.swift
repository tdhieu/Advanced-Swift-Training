//
//  ViewController.swift
//  gestureADV-xcode6
//
//  Created by Tran Duc Hieu on 9/22/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Add gesture to image by code
        
        var img:UIImageView = UIImageView(frame: CGRectMake(50, 50, 100, 100))
        img.image = UIImage(named: "facebook_1405369929351.jpg")
        self.view.addSubview(img)
        
        var tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "tapTap")
        
        img.addGestureRecognizer(tapGesture)
        img.userInteractionEnabled = true
        
    }
    
    func tapTap() {
        println("Tapped!!")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

