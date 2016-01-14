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
    var arrFilter:[String] = []
    
    var month:Int = 0
    var year:Int = 0
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
        
        year =  components.year
        month = components.month
        
        if (month > 9) {
            lblDateTime.text = String(month) + "/" + String(year)
        }
        else {
            lblDateTime.text = "0" + String(month) + "/" + String(year)
        }
        
        loadDataOnParse()
        
        myTableView.reloadData()
    }
    
    func loadDataFromFilter() {
        arrFilter = param.objectForKey("FilterParams") as! [String]
    }
    
    func loadDataOnParse() {
        
        arrRecordID.removeAll()
        arrNote.removeAll()
        arrAmount.removeAll()
        arrDateTime.removeAll()
        arrType.removeAll()
        arrFilter.removeAll()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "loadDataFromFilter", name: "FilterView Param", object: nil)

        // Truy vấn dữ liệu theo điều kiện lọc
        if arrFilter.count > 0 {
            let query = PFQuery(className:"ExpenseManager")
            
            // Điều kiện lọc: từ ngày...
            if arrFilter[0].characters.count > 0 {
                query.whereKey("ExpenseDate", greaterThanOrEqualTo: arrFilter[0])
            }
            
            // Điều kiện lọc: đến ngày...
            if arrFilter[1].characters.count > 0 {
                query.whereKey("ExpenseDate", lessThanOrEqualTo: arrFilter[1])
            }
            
            // Điều kiện lọc: loại thu/chi
            if arrFilter[2].characters.count > 0 {
                query.whereKey("ExpenseType", equalTo: arrFilter[2])
            }

            // Điều kiện lọc: so sánh với một số tiền cho trước
            if arrFilter[5].characters.count > 0 {
                switch arrFilter[4] {
                    case "<": query.whereKey("ExpenseAmount", lessThan: arrFilter[5])
                    case "<=": query.whereKey("ExpenseAmount", lessThanOrEqualTo: arrFilter[5])
                    case ">=": query.whereKey("ExpenseAmount", greaterThanOrEqualTo: arrFilter[5])
                    case ">": query.whereKey("ExpenseAmount", greaterThan: arrFilter[5])
                    default: query.whereKey("ExpenseAmount", equalTo: arrFilter[5])
                }
            }

            // Điều kiện lọc: dựa theo hạn mục/nội dung
            if arrFilter[6].characters.count > 0 {
                query.whereKey("ExpenseNote", equalTo: arrFilter[6])
            }

            
            query.findObjectsInBackgroundWithBlock {
                (objects: [PFObject]?, error: NSError?) -> Void in
                
                if error == nil {
                    // The find succeeded. Do something with the found objects
                    if let objects = objects {
                        for object in objects {
                            let recordID = object["objectId"] as! String
                            self.arrRecordID.append(recordID)
                            
                            let recordNote = object["ExpenseNote"] as! String
                            self.arrNote.append(recordNote)
                            
                            let recordAmount = object["ExpenseAmount"] as! String
                            self.arrAmount.append(recordAmount)
                            
                            let recordDate = object["ExpenseDate"] as! String
                            self.arrDateTime.append(recordDate)
                            
                            let recordType = object["ExpenseType"] as! String
                            self.arrType.append(recordType)
                        }
                    }
                } else {
                    let alert = UIAlertController(title: "Thông báo", message: "Không lấy được dữ liệu. Xin vui lòng kiểm tra lại kết nối!", preferredStyle: UIAlertControllerStyle.Alert)
                    
                    // Thêm hành động
                    alert.addAction(UIAlertAction(title: "Đồng ý", style: UIAlertActionStyle.Default, handler: nil))
                    
                    // Hiển thị cảnh báo
                    self.presentViewController(alert, animated: true, completion: nil)
                }
            }

        }
        // Lấy toàn bộ dữ liệu
        else {
            // Load all data from parse to array
            let query = PFQuery(className:"ExpenseManager")
            
            query.findObjectsInBackgroundWithBlock {
                (objects: [PFObject]?, error: NSError?) -> Void in
                
                if error == nil {
                    if let objects = objects as [PFObject]! {
                        for object in objects {
                            
                            let recordID = object["objectId"] as! String
                            self.arrRecordID.append(recordID)
                            
                            let recordNote = object["ExpenseNote"] as! String
                            self.arrNote.append(recordNote)
                            
                            let recordAmount = object["ExpenseAmount"] as! String
                            self.arrAmount.append(recordAmount)
                            
                            let recordDate = object["ExpenseDate"] as! String
                            self.arrDateTime.append(recordDate)
                            
                            let recordType = object["ExpenseType"] as! String
                            self.arrType.append(recordType)
                        }
                    }
                }
                else {
                    let alert = UIAlertController(title: "Thông báo", message: "Không lấy được dữ liệu. Xin vui lòng kiểm tra lại kết nối!", preferredStyle: UIAlertControllerStyle.Alert)
                    
                    // Thêm hành động
                    alert.addAction(UIAlertAction(title: "Đồng ý", style: UIAlertActionStyle.Default, handler: nil))
                    
                    // Hiển thị cảnh báo
                    self.presentViewController(alert, animated: true, completion: nil)
                }
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
        var deleteCheck:Bool = true
        
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
                        deleteCheck = false
                    }
                }
            }))
            
            // Hiển thị cảnh báo
            self.presentViewController(alert, animated: true, completion: nil)
            
            if deleteCheck == false {
                let alert = UIAlertController(title: "Thông báo", message: "Có lỗi xảy ra trong quá trình xoá dữ liệu!", preferredStyle: UIAlertControllerStyle.Alert)
                
                // Thêm hành động
                alert.addAction(UIAlertAction(title: "Trở lại", style: UIAlertActionStyle.Default, handler: nil))
                
                // Hiển thị cảnh báo
                self.presentViewController(alert, animated: true, completion: nil)                
            }
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
    
    func reportExpense(month:Int, year:Int) -> String {
        var report:String = ""
        let query = PFQuery(className:"ExpenseManager")
        
        // Điều kiện lọc: từ ngày 01-month-year đến ngày 31-month-year
        query.whereKey("ExpenseDate", greaterThanOrEqualTo: "01-"+String(month)+"-"+String(year))
        query.whereKey("ExpenseDate", lessThanOrEqualTo: "31-"+String(month)+"-"+String(year))
        
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                // The find succeeded. Do something with the found objects
                if let objects = objects {
                    for object in objects {
                        let recordNote = object["ExpenseNote"] as! String
                        let recordAmount = object["ExpenseAmount"] as! String
                        let recordDate = object["ExpenseDate"] as! String
                        let recordType = object["ExpenseType"] as! String
                        
                        report += recordType + ": " + recordNote + "\n"
                        report += "Số tiền: " + recordAmount + " - Ngày:" + recordDate + "\n"
                        report += "---------------------\n\n"
                    }
                }
            } else {
                let alert = UIAlertController(title: "Thông báo", message: "Không lấy được dữ liệu. Xin vui lòng kiểm tra lại kết nối!", preferredStyle: UIAlertControllerStyle.Alert)
                
                // Thêm hành động
                alert.addAction(UIAlertAction(title: "Đồng ý", style: UIAlertActionStyle.Default, handler: nil))
                
                // Hiển thị cảnh báo
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
        return report
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposeVC = MFMailComposeViewController()
        mailComposeVC.mailComposeDelegate = self
        mailComposeVC.setToRecipients([])
        mailComposeVC.setSubject("Báo cáo thu chi tháng " + String(month) + "/" + String(year))
        mailComposeVC.setMessageBody(reportExpense(month, year: year), isHTML: false)
        return mailComposeVC
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        if error != nil{
            let alert = UIAlertController(title: "Thông báo", message: "Chưa gửi được email. Xin vui lòng kiểm tra lại đường truyền!", preferredStyle: UIAlertControllerStyle.Alert)
            
            // Thêm hành động
            alert.addAction(UIAlertAction(title: "Đồng ý", style: UIAlertActionStyle.Default, handler: nil))
            
            // Hiển thị cảnh báo
            self.presentViewController(alert, animated: true, completion: nil)
            
        } else if result.rawValue == 2 {
            self.dismissViewControllerAnimated(true, completion: nil)
            showAlertSuccess()
        } else {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func showAlertSuccess(){
        let alert:UIAlertController = UIAlertController(title: "Thông báo", message: "Gửi thành công!", preferredStyle: UIAlertControllerStyle.Alert)
        
        let actionOk:UIAlertAction = UIAlertAction(title: "Đồng ý", style: UIAlertActionStyle.Default, handler: {
            finished in
            
        })
        
        alert.addAction(actionOk)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Thông báo", message: "Không thể gửi email. Thiết bị của bạn không cho phép thực hiện chức năng này!", delegate: self, cancelButtonTitle: "Đồng ý")
        sendMailErrorAlert.show()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
