//
//  MiddleTableViewController.swift
//  AdvThreeTableViewInteract
//
//  Created by Tran Duc Hieu on 9/29/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class MiddleTableViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var myMiddleTableView: UITableView!
    
    var arrDistrict:[[String]] = [["a1", "a2", "a3"], ["b1", "b2", "b3"], ["c1", "c2", "c3"]]
    
    var param:NSUserDefaults = NSUserDefaults()
    
    var selectedRow:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myMiddleTableView.delegate = self
        myMiddleTableView.dataSource = self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "LoadData", name: "load", object: nil)
    }

    func LoadData() {
        selectedRow = param.objectForKey("RegionRowIndex") as! Int
        myMiddleTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrDistrict[selectedRow].count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MiddleCell", forIndexPath: indexPath) as! MiddleTableViewCell
        cell.middleImgView.image = UIImage(named: "cdf.jpg")
        cell.middleLabel.text = arrDistrict[selectedRow][indexPath.row]

        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        param.setValue(indexPath.row, forKey: "DistrictRowIndex")
        NSNotificationCenter.defaultCenter().postNotificationName("load", object: nil)
    }
}
