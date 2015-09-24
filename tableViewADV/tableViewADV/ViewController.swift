//
//  ViewController.swift
//  tableViewADV
//
//  Created by Tran Duc Hieu on 9/24/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

// Review for third week

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var myTableView: UITableView!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect myTableView with TableView delegate methods in program
        myTableView.delegate = self
        myTableView.dataSource = self
        
        imgView.image = UIImage(named: "banner.jpg")
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = "ABC"
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.myTableView.frame.origin.x = self.myTableView.frame.origin.x + 350
            self.imgView.frame.origin.x = self.imgView.frame.origin.x - 350
        })
        
    }
    
    @IBAction func btnClick(sender: AnyObject) {
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.myTableView.frame.origin.x = self.myTableView.frame.origin.x - 350
            self.imgView.frame.origin.x = self.imgView.frame.origin.x + 350
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

