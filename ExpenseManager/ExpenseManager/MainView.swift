//
//  MainView.swift
//  ExpenseManager
//
//  Created by Tran Duc Hieu on 12/11/15.
//  Copyright © 2015 Tran Duc Hieu. All rights reserved.
//

import UIKit
import Parse
import MessageUI


class MainView: UIViewController, UITableViewDelegate, UITableViewDataSource, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var lblDateTime: UILabel!
    @IBOutlet weak var myTableView: UITableView!
    
    var arrRecordID:[String] = []
    var arrNote:[String] = []
    var arrAmount:[String] = []
    var arrDateTime:[String] = []
    var arrType:[String] = []
    
    var selectedRecord:Int = -1
    
    var param:NSUserDefaults = NSUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        
        selectedRecord = -1
        
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day, .Month, .Year], fromDate: date)
        
        let year =  components.year
        let month = components.month
        let day = components.day
        
        if (month > 9) {
            lblDateTime.text = String(month) + "/" + String(year)
        }
        else {
            lblDateTime.text = "0" + String(month) + "/" + String(year)
        }
        
        loadDataOnParse()
        
        myTableView.reloadData()
    }
    
    
    func loadDataOnParse() {
        arrRecordID.removeAll()
        arrNote.removeAll()
        arrAmount.removeAll()
        arrDateTime.removeAll()
        arrType.removeAll()
        
        // Load all data from parse to array
        let query = PFQuery(className:"ExpenseManager")

        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                if let objects = objects as [PFObject]! {
                    for object in objects {
                        
                        let recordID = object["objectId"] as! String
                        self.arrRecordID.append(recordID)
                        print(recordID)
                        
                        let recordNote = object["ExpenseNote"] as! String
                        self.arrNote.append(recordNote)
                        print(recordNote)
                        
                        let recordAmount = object["ExpenseAmount"] as! String
                        self.arrAmount.append(recordAmount)
                        print(recordAmount)
                        
                        let recordDate = object["ExpenseDate"] as! String
                        self.arrDateTime.append(recordDate)
                        print(recordDate)

                        let recordType = object["ExpenseType"] as! String
                        self.arrType.append(recordType)
                        print(recordType)
                        
                    }
                }
            }
            else {
                print("#Loading data error!!")
            }
        }
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrNote.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! MainTableViewCell
        cell.myTitle.text = arrNote[indexPath.row]
        cell.myDetail.text = arrAmount[indexPath.row] + " - " + arrDateTime[indexPath.row]
        if arrType[indexPath.row] == "Income" {
            cell.imageView?.image = UIImage(named: "Income.png")
        } else {
            cell.imageView?.image = UIImage(named: "Outcome.png")
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        selectedRecord = indexPath.row
    }
    
    @IBAction func btnEditClick(sender: AnyObject) {
        if selectedRecord >= 0 {
            param.setValue(arrRecordID[selectedRecord], forKey: "RecordID")
            NSNotificationCenter.defaultCenter().postNotificationName("MainView Param", object: nil)
        }
        else {
            // Cảnh báo lỗi chưa chọn dữ liệu
            let alert = UIAlertController(title: "Thông báo", message: "Bạn chưa chọn một dòng dữ liệu để điều chỉnh!", preferredStyle: UIAlertControllerStyle.Alert)
            
            // Thêm hành động
            alert.addAction(UIAlertAction(title: "Đồng ý", style: UIAlertActionStyle.Default, handler: nil))
            alert.addAction(UIAlertAction(title: "Huỷ bỏ", style: UIAlertActionStyle.Cancel, handler: nil))
            
            // Hiển thị cảnh báo
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnDeleteClick(sender: AnyObject) {
        if selectedRecord >= 0 {
         
            // Xác nhận xoá dữ liệu
            let alert = UIAlertController(title: "Thông báo", message: "Bạn có chắc muốn thực hiện hành động này ?", preferredStyle: UIAlertControllerStyle.Alert)
            
            // Thêm hành động
            alert.addAction(UIAlertAction(title: "Huỷ bỏ", style: UIAlertActionStyle.Cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "Thực hiện", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
                let recordID = self.arrRecordID[self.selectedRecord]
                
                self.arrRecordID.removeAtIndex(self.selectedRecord)
                self.arrNote.removeAtIndex(self.selectedRecord)
                self.arrDateTime.removeAtIndex(self.selectedRecord)
                self.arrAmount.removeAtIndex(self.selectedRecord)
                self.arrType.removeAtIndex(self.selectedRecord)
                
                // Xoá dòng dữ liệu được chọn trên Parse
                let query = PFQuery(className:"ExpenseManager")
                query.getObjectInBackgroundWithId(recordID) {
                    (deleteObject: PFObject?, error: NSError?) -> Void in
                    if error == nil && deleteObject != nil {
                        deleteObject!.deleteInBackgroundWithBlock(nil)
                    } else {
                        print("#Deleting error!")
                    }
                }
                
            }))
            
            // Hiển thị cảnh báo
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else {
            
            // Cảnh báo lỗi chưa chọn dữ liệu
            let alert = UIAlertController(title: "Thông báo", message: "Bạn chưa chọn một dòng dữ liệu để xoá!", preferredStyle: UIAlertControllerStyle.Alert)
            
            // Thêm hành động
            alert.addAction(UIAlertAction(title: "Đồng ý", style: UIAlertActionStyle.Default, handler: nil))
            alert.addAction(UIAlertAction(title: "Huỷ bỏ", style: UIAlertActionStyle.Cancel, handler: nil))
            
            // Hiển thị cảnh báo
            self.presentViewController(alert, animated: true, completion: nil)
            
        }
    }
    
    @IBAction func btnExitClick(sender: AnyObject) {
        // Xác nhận thoát khỏi ứng dụng
        let alert = UIAlertController(title: "Thông báo", message: "Bạn có muốn thoát khỏi ứng dụng ?", preferredStyle: UIAlertControllerStyle.Alert)
        
        // Thêm hành động
        alert.addAction(UIAlertAction(title: "Thực hiện", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
            exit(0)
        }))
        alert.addAction(UIAlertAction(title: "Huỷ bỏ", style: UIAlertActionStyle.Cancel, handler: nil))
        
        // Hiển thị cảnh báo
        self.presentViewController(alert, animated: true, completion: nil)

    }
    
    
    @IBAction func btnSendReport(sender: AnyObject) {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.presentViewController(mailComposeViewController, animated:true, completion:nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposeVC = MFMailComposeViewController()
        mailComposeVC.mailComposeDelegate = self
        mailComposeVC.setToRecipients([])
        mailComposeVC.setSubject("abc")
        mailComposeVC.setMessageBody("abcd", isHTML: false)
        return mailComposeVC
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        print(result)
        if error != nil{
            print("loi roi\(error)")
            
        }else if result.rawValue == 2 {
            print("gui thanh cong roi")
            self.dismissViewControllerAnimated(true, completion: nil)
            showAlertSuccess()
        }else {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func showAlertSuccess(){
        print("ok")
        let alert:UIAlertController = UIAlertController(title: "Sucessed", message: "Send mail sucessed", preferredStyle: UIAlertControllerStyle.Alert)
        
        let actionOk:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {
            finished in
            
        })
        
        alert.addAction(actionOk)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
}
