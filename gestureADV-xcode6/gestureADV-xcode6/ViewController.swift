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
        lbl.text = "this is the content of the label"
        lbl.textColor = UIColor.redColor()
        lbl.textAlignment = NSTextAlignment.Center
        lbl.font = UIFont.systemFontOfSize(20)
        lbl.numberOfLines = 5
        self.view.addSubview(lbl)
        
        var button:UIButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        button.tag = 1
        button.frame = CGRectMake(100, 100, 50, 50)
        button.setTitle("Okay", forState: UIControlState.Normal)
        button.addTarget(self, action: "btnClick:", forControlEvents: UIControlEvents.TouchUpInside)

        self.view.addSubview(button)
        
        var btn:UIButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        btn.tag = 2
        btn.frame = CGRectMake(100, 100, 50, 50)
        btn.setTitle("Okay", forState: UIControlState.Normal)
        btn.addTarget(self, action: "btnClick:", forControlEvents: UIControlEvents.TouchUpInside)

        self.view.addSubview(btn)
        
        // Bai tap: tao cac doi tuong sau bang code
        // 1 label "Ho Ten" - 1 textview
        // 1 label "Ngay Sinh" - 1 textview
        // 1 label "Email" - 1 textview
        // 1 button nam giua man hinh
    }
    
    func tapTap(tapGesture:UITapGestureRecognizer) {
        println("Tapped!!")
    }

    func tapTapLong(tapLongGesture:UILongPressGestureRecognizer) {
        println("Tap Long Gesture!!")
    }
    
    func btnClick(btn:UIButton) {
        if btn.tag == 1 {
            println("Button 1 Clicked!")
        } else {
            println("Button 2 Clicked!")
        }        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

