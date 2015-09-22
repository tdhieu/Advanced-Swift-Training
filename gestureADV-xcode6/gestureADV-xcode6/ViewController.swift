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
        
        // Function with parameter must come with ":"
        var tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "tapTap:")

        // tapGesture.numberOfTapsRequired
        // tapGesture.numberOfTouches()
        
        img.addGestureRecognizer(tapGesture)
        img.userInteractionEnabled = true
        
        var tapLongGesture:UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: "tapTapLong:")
        
        img.addGestureRecognizer(tapLongGesture)
        
        var lbl:UILabel = UILabel(frame: CGRectMake(0, 0, 200, 200))
        lbl.text = "label name"
        lbl.textColor = UIColor.redColor()
        lbl.textAlignment = NSTextAlignment.Center
        lbl.font = UIFont(name: "Times New Romance", size: 13)
        
        self.view.addSubview(lbl)
        
    }
    
    func tapTap(tapGesture:UITapGestureRecognizer) {
        println("Tapped!!")
    }

    func tapTapLong(tapLongGesture:UILongPressGestureRecognizer) {
        println("Tap Long Gesture!!")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

