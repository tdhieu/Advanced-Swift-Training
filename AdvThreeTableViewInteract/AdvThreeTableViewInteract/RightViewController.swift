//
//  RightViewController.swift
//  AdvThreeTableViewInteract
//
//  Created by Tran Duc Hieu on 10/1/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class RightViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var myRightTableView: UITableView!
    
    var arrLincensePlates:[[String]] = [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]]
    
    var selectedRow:Int = 0
    
    var param:NSUserDefaults = NSUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myRightTableView.delegate = self
        myRightTableView.dataSource = self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "LoadData", name: "load3", object: nil)
    }
    
    func LoadData() {
        selectedRow = param.objectForKey("DistrictRowIndex") as! Int
        myRightTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrLincensePlates[selectedRow].count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RightCell", forIndexPath: indexPath) as! RightTableViewCell
        
        //        cell.rightImgView.image = UIImage(named: "abc.png")
        cell.rightLabel.text = arrLincensePlates[selectedRow][indexPath.row]
        
        return cell
    }

}
