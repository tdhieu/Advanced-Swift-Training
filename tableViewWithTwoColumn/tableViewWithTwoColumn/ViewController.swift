//
//  ViewController.swift
//  tableViewWithTwoColumn
//
//  Created by Tran Duc Hieu on 9/29/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    /* Bai tap ve nha:
    TableView co 1 nut chon
    TableView co 2 cot du lieu
    Co cac Button de check va uncheck
    */

    @IBOutlet var myTableView: UITableView!
    
    var arrND:[[String]] = [["1111", "2222"], ["3333", "4444"], ["5555", "6666"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return arrND[0].count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrND.count
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

