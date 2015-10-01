//
//  LeftViewController.swift
//  AdvTableViewInteract
//
//  Created by Tran Duc Hieu on 9/29/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var myLeftTableView: UITableView!
    
    var leftArr:[String] = ["Nhom 1", "Nhom 2", "Nhom 3"]
    
    var param:NSUserDefaults = NSUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myLeftTableView.delegate = self
        self.myLeftTableView.dataSource = self
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leftArr.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("LeftCell", forIndexPath: indexPath) as! LeftTableViewCell
        
        cell.leftLblTitle.text = leftArr[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        param.setValue(indexPath.row, forKey: "Param")
        
        NSNotificationCenter.defaultCenter().postNotificationName("load", object: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()

    }
    
    /* Bai tap ve nha:
    1/ Tao 3 tableView
    2/ Column 1: danh sach 52 tinh thanh, Column 2: danh sach cac quan, Column 3: bien so xe cua Quan/Huyen
    https://vi.wikipedia.org/wiki/Biển_xe_cơ_giới_Việt_Nam
    */
}
