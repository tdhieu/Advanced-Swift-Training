//
//  EditView.swift
//  ExpenseManager
//
//  Created by Tran Duc Hieu on 1/3/16.
//  Copyright © 2016 Tran Duc Hieu. All rights reserved.
//

import UIKit
import Parse

class EditView: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {


    @IBOutlet weak var selectDate: UILabel!
    @IBOutlet weak var myDatePicker: UIDatePicker!
    @IBOutlet weak var mySelector: UISegmentedControl!
    @IBOutlet weak var tbxMoneyAmount: UITextField!
    @IBOutlet weak var tbxNote: UITextField!
    @IBOutlet weak var myPickerView: UIPickerView!

    var param:NSUserDefaults = NSUserDefaults()
    
    var expenseID:String = ""
    var expenseContent:String = ""
    var expenseAmount:String = ""
    var expenseDate:String = ""
    var expenseType:String = ""
    var loadOkay:Bool = false
    
    var pickerViewDataSource:[String] = ["Tiền lương", "Tiền làm thêm", "Tiền đi ăn", "Tiền mừng đám cưới", "Tiền xem phim", "Tiền tập Gym", "Tiền chơi bóng bàn", "Tiền tập bóng bàn", "Tiền Internet", "Tiền điện", "Tiền nước", "Tiền điện thoại", "Tiền xăng", "Tiền ăn vặt", "Khoản khác"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myPickerView.dataSource = self
        self.myPickerView.delegate = self
        
        mySelector.selectedSegmentIndex = 0
        
        selectDate.text = ""
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "loadDataOnParse", name: "MainView Param", object: nil)
        
        if loadOkay == true {
            updateView()
        }
    }
    
    func loadDataOnParse() {
        expenseID = param.objectForKey("RecordID") as! String
        
        // Load data on Parse based on ObjectID
        let query = PFQuery(className:"ExpenseManager")
        query.getObjectInBackgroundWithId(expenseID) {
            (object: PFObject?, error: NSError?) -> Void in
            if error == nil && object != nil {
                self.expenseContent = object?.objectForKey("ExpenseNote") as! String
                self.expenseAmount = object?.objectForKey("ExpenseAmount") as! String
                self.expenseDate = object?.objectForKey("ExpenseDate") as! String
                self.expenseType = object?.objectForKey("ExpenseType") as! String
                self.loadOkay = true
            } else {
                let alert = UIAlertController(title: "Thông báo", message: "Không lấy được dữ liệu. Vui lòng kiểm tra lại kết nối!", preferredStyle: UIAlertControllerStyle.Alert)
                
                // Thêm hành động
                alert.addAction(UIAlertAction(title: "Trở lại", style: UIAlertActionStyle.Default, handler: nil))
                
                // Hiển thị cảnh báo
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
    }
    
    func updateView() {
        selectDate.text = expenseDate
        
        // Set DateTimePicker
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let date = dateFormatter.dateFromString(expenseDate)
        if let unwrappedDate = date {
            myDatePicker.setDate(unwrappedDate, animated: false)
        }
        
        // Set Segmented Control
        if expenseType == "Thu" {
            mySelector.selectedSegmentIndex = 0
        } else {
            mySelector.selectedSegmentIndex = 1
        }
        
        tbxMoneyAmount.text = expenseAmount
        tbxNote.text = expenseContent
        
        var selectedRow = pickerViewDataSource.count-1
        for var row = 0; row < pickerViewDataSource.count; row++ {
            if expenseContent == pickerViewDataSource[row] {
                selectedRow = row
                break;
            }
        }
        myPickerView.selectRow(selectedRow, inComponent: 0, animated: true)
    }

    @IBAction func datePickerAction(sender: AnyObject) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let strDate = dateFormatter.stringFromDate(myDatePicker.date)
        self.expenseDate = strDate
    }
    
    @IBAction func mySelectorAction(sender: AnyObject) {
        if(mySelector.selectedSegmentIndex == 0)
        {
            expenseType = "Thu";
        } else {
            expenseType = "Chi";
        }
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerViewDataSource.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerViewDataSource[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerViewDataSource[row] == "Khoản khác" {
            tbxNote.text = ""
        } else {
            tbxNote.text = pickerViewDataSource[row]
        }
        expenseContent = tbxNote.text!
    }
    
    @IBAction func btnSaveClick(sender: AnyObject) {
        let moneyAmount:String = tbxMoneyAmount.text!
        if moneyAmount.isEmpty {
            let alert = UIAlertController(title: "Thông báo", message: "Bạn chưa nhập số tiền phát sinh!", preferredStyle: UIAlertControllerStyle.Alert)
            
            // Thêm hành động
            alert.addAction(UIAlertAction(title: "Trở lại", style: UIAlertActionStyle.Default, handler: nil))
            
            // Hiển thị cảnh báo
            self.presentViewController(alert, animated: true, completion: nil)
            
        } else if expenseContent.isEmpty {
            let alert = UIAlertController(title: "Thông báo", message: "Bạn chưa xác định hạn mục của khoản phát sinh!", preferredStyle: UIAlertControllerStyle.Alert)
            
            // Thêm hành động
            alert.addAction(UIAlertAction(title: "Trở lại", style: UIAlertActionStyle.Default, handler: nil))
            
            // Hiển thị cảnh báo
            self.presentViewController(alert, animated: true, completion: nil)
            
        } else {
            let dataObject = PFObject(className:"ExpenseManager")
            dataObject["ExpenseNote"] = expenseContent
            dataObject["ExpenseAmount"] = expenseAmount
            dataObject["ExpenseDate"] = expenseDate
            dataObject["ExpenseType"] = expenseType
            dataObject.saveInBackgroundWithBlock {
                (success: Bool, error: NSError?) -> Void in
                if (success) {
                    let alert = UIAlertController(title: "Thông báo", message: "Dữ liệu đã được cập nhật!", preferredStyle: UIAlertControllerStyle.Alert)
                    
                    // Thêm hành động
                    alert.addAction(UIAlertAction(title: "Đồng ý", style: UIAlertActionStyle.Default, handler: nil))
                    
                    // Hiển thị cảnh báo
                    self.presentViewController(alert, animated: true, completion: nil)
                } else {
                    let alert = UIAlertController(title: "Thông báo", message: "Chưa cập nhật được dữ liệu!", preferredStyle: UIAlertControllerStyle.Alert)
                    
                    // Thêm hành động
                    alert.addAction(UIAlertAction(title: "Trở lại", style: UIAlertActionStyle.Default, handler: nil))
                    
                    // Hiển thị cảnh báo
                    self.presentViewController(alert, animated: true, completion: nil)
                }
            }
            
        }
    }
    
    @IBAction func btnCancelClick(sender: AnyObject) {
        // Do nothing, just return to the MainView
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
