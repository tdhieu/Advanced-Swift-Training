//
//  ViewController.swift
//  TBExercise1
//
//  Created by Tran Duc Hieu on 9/24/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var imgView: UIImageView!
    
    @IBOutlet var myTableView: UITableView!
    
    var arrImg:[String] = ["1.png", "2.png", "3.png", "4.png", "5.png", "6.png", "7.png", "8.png"]
    
    var testCell = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        
        imgView.frame.origin.y = -200.0
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrImg.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        cell.imageView?.image = UIImage(named: arrImg[indexPath.row])
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.myTableView.frame.origin.y = self.myTableView.frame.origin.y + 200
        })
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.imgView.center = CGPoint(x: 20, y: 200)
        }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

