//
//  ViewController.swift
//  DemoParse01
//
//  Created by Tran Duc Hieu on 10/13/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    @IBOutlet var txtName: UITextField!
    @IBOutlet var txtBirthday: UITextField!
    @IBOutlet var txtCell: UITextField!
    @IBOutlet var txtAddress: UITextField!
    
    let myDB = PFObject(className: "Employee")
    
    @IBAction func btnAdd(sender: AnyObject) {
//        myDB["Name"] = txtName.text
//        myDB["Birthday"] = txtBirthday.text
//        myDB["Cell"] = txtCell.text
//        myDB["Address"] = txtAddress.text
//        myDB.saveInBackgroundWithBlock{(message, error) -> Void in
//            if error != nil {
//                print(error)
//            }
//            else {
//                print("Add successfully!")
//            }
//        }

       
        let query = PFQuery(className:"Employee")
//        query.whereKey("Name", equalTo:"Tran Duc Hieu")
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) scores.")
                // Do something with the found objects
                if let objects = objects as [PFObject]! {
                    for object in objects {
                        print(object["Address"] as! String)
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
/*        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("Object has been saved.")
        }
*/
        
        
/*        let myDB = PFObject(className: "HocSinh") // Create new database table
        myDB["HoTen"] = "AAAA"  // Create new field and its value
        myDB["Email"] = "aaaa@abbb.com"
        myDB.saveInBackgroundWithBlock{(message, error) -> Void in
            if error != nil {
                print(error)
            }
            else {
                print("Save successfully!")
            }
        }
*/
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

