//
//  ViewController.swift
//  AdvTableView03
//
//  Created by Tran Duc Hieu on 10/1/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var myTableView: UITableView!
    
    var arrND:[String] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "o", "p", "q", "r", "s",
                          "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "o", "p", "q", "r", "s"]
    
    var refreshTable:UIRefreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        
        refreshTable.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshTable.addTarget(self, action: "Refresh", forControlEvents: UIControlEvents.ValueChanged)
        myTableView.addSubview(refreshTable)
    }
    
    func Refresh() {
        arrND.append("new Element")
        myTableView.reloadData()
        refreshTable.endRefreshing()
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrND.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TableViewCell
        cell.lblTitle.text = arrND[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        /* animation 1
        // Chuyển độ sáng của table view từ 0 sang 1
        cell.alpha = 0 // transparency degree
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            cell.alpha = 1
        })
        */

        /* animation 2
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 0)
        cell.layer.transform = rotationTransform
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            cell.layer.transform = CATransform3DIdentity
        })
        */
        
        /* animation 3
        let scaleTransform = CATransform3DMakeScale(0.5, 2, 2)
        cell.layer.transform = scaleTransform
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            cell.layer.transform = CATransform3DIdentity
        })
        */
        
        /* animation 4
        // Cach 1
        var rotation:CATransform3D = CATransform3D()
        rotation = CATransform3DMakeRotation(CGFloat((90.0 * M_PI)/180), 0.0, 0.7, 0.4)
        cell.layer.transform = rotation
        cell.layer.shadowColor = UIColor.blackColor().CGColor
        cell.layer.shadowOffset = CGSizeMake(10, 10)
        cell.alpha = 0
        cell.layer.anchorPoint = CGPointMake(0, 0.5)
        
        
        (0,0)       (0.5,0)         (1,0)
        
        (0,0.5)     (0.5,0.5)       (1,0.5)
        
        (0,1),      (0.5,1),        (1,1)
 
        
        // Cach 1
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1
        })

        // Cach 2
        UIView.beginAnimations("rotation", context: nil)
        UIView.setAnimationDuration(0.8)
        cell.layer.transform = CATransform3DIdentity
        cell.alpha = 1
        cell.layer.shadowOffset = CGSizeMake(0, 0)
        UIView.commitAnimations()
*/
        
        /* Bai tap ve nha
        Lam 1 form log-in
        - 2 label, 2 text field, 1 button
        - Khi chay ung dung len thi label1 va textfield 1 chay tu` trai qua phai
        - ro`i den label2 va textfield2 chay tu` trai qua phai
        - button tu` tren roi xuong
        - Khi nhan button thi` button rot xuong 1 doan va` hien len labelChecking (noi dung: "Dang checking")
        - Sau do labelChecking chay qua trai va bien mat, button tro ve vi tri ban dau
        */
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

