//
//  LeftViewController.swift
//  AdvThreeTableViewInteract
//
//  Created by Tran Duc Hieu on 10/1/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var myLeftTableView: UITableView!

    var arrProvince:[String] = ["a", "b", "c"]
    
    var param:NSUserDefaults = NSUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLeftTableView.delegate = self
        myLeftTableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrProvince.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("LeftCell", forIndexPath: indexPath) as! LeftTableViewCell
        //        cell.leftImgView.image = UIImage(named: "abc.jpg")
        cell.leftLabel.text = arrProvince[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        param.setValue(indexPath.row, forKey: "RegionRowIndex")
        NSNotificationCenter.defaultCenter().postNotificationName("load2", object: nil)
    }
}
