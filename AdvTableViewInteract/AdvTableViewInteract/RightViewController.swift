//
//  RightViewController.swift
//  AdvTableViewInteract
//
//  Created by Tran Duc Hieu on 9/29/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class RightViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var myRightTableView: UITableView!
    
//    var rightArr:[String] = ["1", "2", "3", "4", "5"]
    
    var rightArr:[[String]] = [["Iphone", "SamSung"], ["LG", "HTC"], ["Sonny", "Oppo"]]
    
    var rowIndex:Int = 0
    
    var param:NSUserDefaults = NSUserDefaults()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.myRightTableView.delegate = self
        self.myRightTableView.dataSource = self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "LoadList", name: "load", object: nil)
    }
    
    func LoadList() {
        
        rowIndex = param.objectForKey("Param") as! Int
        myRightTableView.reloadData()
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rightArr[rowIndex].count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("RightCell", forIndexPath: indexPath) as! RightTableViewCell
        
        cell.rightLblTitle.text = rightArr[rowIndex][indexPath.row]
        
        return cell
    }
    
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()

    }
    


}
