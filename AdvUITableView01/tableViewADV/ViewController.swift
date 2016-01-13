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
    @IBOutlet var txtName: UITextField!
    @IBOutlet var txtPass: UITextField!
    
    var arrND:[String] = ["AAAA", "BBBB", "CCCC", "DDDD"]
    
    var testCell:Bool = true
    
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
        return arrND.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = arrND[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if testCell == true {
            testCell = false
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.myTableView.frame.origin.x = self.myTableView.frame.origin.x + 300
                self.imgView.frame.origin.x = self.imgView.frame.origin.x - 300
                /*          self.txtName.text = tableView.cellForRowAtIndexPath(indexPath)?.textLabel?.text
                self.txtPass.text = String(indexPath.item)
                */
            })
        } else {
            testCell = true
            
            UIView.animateWithDuration(0.1, animations: { () -> Void in
                self.myTableView.frame.origin.x = self.myTableView.frame.origin.x + 20
                self.imgView.frame.origin.x = self.imgView.frame.origin.x - 20
            }, completion: {
                finished in
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.myTableView.frame.origin.x = self.myTableView.frame.origin.x - 320
                    self.imgView.frame.origin.x = self.imgView.frame.origin.x + 320
                })
            })
            
        }
    }
    
    @IBAction func btnClick(sender: AnyObject) {
        arrND.append("EEEE")
        myTableView.reloadData()
        
        testCell = true
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.myTableView.frame.origin.x = self.myTableView.frame.origin.x + 20
            self.imgView.frame.origin.x = self.imgView.frame.origin.x - 20
            }, completion: {
                finished in
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.myTableView.frame.origin.x = self.myTableView.frame.origin.x - 320
                    self.imgView.frame.origin.x = self.imgView.frame.origin.x + 320
                })
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

