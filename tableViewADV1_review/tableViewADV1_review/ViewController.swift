//
//  ViewController.swift
//  tableViewADV1_review
//
//  Created by Tran Duc Hieu on 9/26/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var myTableView: UITableView!
    
    var arrND:[String] = ["11111", "22222", "33333", "44444", "55555", "66666", "77777"]
    var arrCheck:[Int] = [0,0,0,0,0,0,0]
    
    @IBOutlet var myView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        myView.hidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func editTableView(sender: AnyObject) {
        // Tu dong chuyen trang thai edit hoac ko edit
        var alert:UIAlertController = UIAlertController(title: "Confirm!!", message: "Select Insert or Edit", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        var actionInsert:UIAlertAction = UIAlertAction(title: "Insert", style: UIAlertActionStyle.Default, handler: {
            finished in
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.myTableView.frame.origin.x -= 300
                self.myTableView.hidden = true
            }, completion: {
                finished in
                self.myView.hidden = false
            })
        })
        
        alert.addAction(actionInsert)
        
        var actionEdit:UIAlertAction = UIAlertAction(title: "Edit", style: UIAlertActionStyle.Default, handler: {
            finished in
            self.myTableView.editing = !self.myTableView.editing
        })
        
        alert.addAction(actionEdit)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBOutlet var txtContent: UITextField!
    
    @IBAction func btnInsert(sender: AnyObject) {
        arrND.append(txtContent.text)
        myTableView.reloadData()
        self.myView.hidden = true
        self.myTableView.hidden = false
        self.myTableView.frame.origin.x += 300
        self.txtContent.text = ""
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
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            arrND.removeAtIndex(indexPath.row)
            self.myTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left)
            
        }
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        var removedElement = arrND.removeAtIndex(sourceIndexPath.row)
        arrND.insert(removedElement, atIndex: destinationIndexPath.row)
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let cell = myTableView.cellForRowAtIndexPath(indexPath)
        if cell?.accessoryType == UITableViewCellAccessoryType.Checkmark {
            cell?.accessoryType = UITableViewCellAccessoryType.None
            arrCheck[indexPath.row] = 0
            for i in 0...arrCheck.count-1 {
                if arrCheck[i] == 1 {
                    print(arrND[i] + "\n")
                }
            }
            
        } else {
            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
            arrCheck[indexPath.row] = 1
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

