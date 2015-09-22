//
//  tableViewController.swift
//  jsonADV-xcode6
//
//  Created by Tran Duc Hieu on 9/22/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class tableViewController: UITableViewController {

    var arrND:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlJSON = NSURL(string: "http://caphesinhvien.com/app-music/song.json")!
        
        // Open connection to url
        let session: NSURLSession = NSURLSession.sharedSession()

        let task = session.dataTaskWithURL(urlJSON, completionHandler: { (data, response, error) -> Void in
            // Ket qua url co bi loi hay ko, ney co loi thi print loi
            if (error != nil) {
                println(error)
            } else {
                // tao bien jSonResult de luu gia tri cua json, json se tra ve kieu du lieu la NSDictionary
                
                let jSonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
                
                // lay du lieu tu Dictionary ra theo key
                println(jSonResult)
                
                var numberOfElement:Int? = jSonResult["song"]?.count
                
                for i in 0...numberOfElement! - 1 {
                    self.arrND.append(jSonResult["song"]?[i]["item_song"] as! String)
                    
                    // Dam bao du lieu tra ve ro`i moi reload TableView
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        println("abc")
                        self.tableView.reloadData()
                    })
                }
            }
            
        })
        task.resume()
        
/*      reload data len tableView
        sleep(1)
        tableView.reloadData()*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return arrND.count
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
