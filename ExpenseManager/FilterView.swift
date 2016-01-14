//
//  FilterView.swift
//  ExpenseManager
//
//  Created by Tran Duc Hieu on 1/13/16.
//  Copyright © 2016 Tran Duc Hieu. All rights reserved.
//

import UIKit
import Parse

class FilterView: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var tbxDateFrom: UITextField!
    @IBOutlet weak var tbxDateTo: UITextField!
    @IBOutlet weak var mySelector: UISegmentedControl!
    @IBOutlet weak var myOperator: UISegmentedControl!
    @IBOutlet weak var tbxMoneyAmount: UITextField!
    @IBOutlet weak var myCategoryPicker: UIPickerView!
    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    var pickerViewDataSource:[String] = ["Tiền lương", "Tiền làm thêm", "Tiền đi ăn", "Tiền mừng đám cưới", "Tiền xem phim", "Tiền tập Gym", "Tiền chơi bóng bàn", "Tiền tập bóng bàn", "Tiền Internet", "Tiền điện", "Tiền nước", "Tiền điện thoại", "Tiền xăng", "Tiền ăn vặt", "Khoản khác"]

    
    var dateFrom:String = ""
    var dateTo:String = ""
    var expenseType:String = ""
    var compare:String = ""
    var expenseAmount:String = ""
    var expenseContent:String = ""
    var expenseDate:String = ""
    var focusDate:String = ""
    
    var param:NSUserDefaults = NSUserDefaults()
    
    @IBAction func tbxDateFromEditted(sender: AnyObject) {
        dateFrom = tbxDateFrom.text!
    }
    
    @IBAction func tbxDateToEditted(sender: AnyObject) {
        dateTo = tbxDateTo.text!
    }
    
    @IBAction func mySelectorChanged(sender: AnyObject) {
        if mySelector.selectedSegmentIndex == 0 {
            expenseType = "Thu"
        } else {
            expenseType = "Chi"
        }
    }
    
    @IBAction func myOperatorChanged(sender: AnyObject) {
        switch mySelector.selectedSegmentIndex {
        case 0: compare = "<"
        case 1: compare = "<="
        case 2: compare = "="
        case 3: compare = ">="
        default: compare = ">"
        }
    }
    
    @IBAction func tbxMoneyAmountEditted(sender: AnyObject) {
        expenseAmount = tbxMoneyAmount.text!
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
        expenseContent = pickerViewDataSource[row]
    }

    @IBAction func tbxFromDateFocused(sender: AnyObject) {
        focusDate = "FromDate"
    }
    
    @IBAction func tbxToDateFocused(sender: AnyObject) {
        focusDate = "ToDate"
    }
    
    @IBAction func myDatePickerChanged(sender: AnyObject) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let strDate = dateFormatter.stringFromDate(myDatePicker.date)
        self.expenseDate = strDate
        if focusDate == "FromDate" {
            tbxDateFrom.text = strDate
        } else if focusDate == "ToDate" {
            tbxDateTo.text = strDate
        }
    }
    
    @IBAction func btnProceed(sender: AnyObject) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"

        let fromDate = dateFormatter.dateFromString(tbxDateFrom.text!)
        let toDate = dateFormatter.dateFromString(tbxDateTo.text!)
        
        let order = NSCalendar.currentCalendar().compareDate(fromDate!, toDate: toDate!, toUnitGranularity: .Day)

        if order == .OrderedDescending {
            let alert = UIAlertController(title: "Thông báo", message: "Ngày bắt đầu lớn hơn ngày kết thúc!", preferredStyle: UIAlertControllerStyle.Alert)
            
            // Thêm hành động
            alert.addAction(UIAlertAction(title: "Đồng ý", style: UIAlertActionStyle.Default, handler: nil))
            
            // Hiển thị cảnh báo
            self.presentViewController(alert, animated: true, completion: nil)
            
        } else {
            var arrFilter:[String] = []

            arrFilter.append(dateFrom)
            arrFilter.append(dateTo)
            arrFilter.append(expenseType)
            arrFilter.append(compare)
            arrFilter.append(expenseAmount)
            arrFilter.append(expenseContent)
            
            param.setValue(arrFilter, forKey: "FilterParams")
            NSNotificationCenter.defaultCenter().postNotificationName("FilterView Param", object: nil)
        }
    }
    
    @IBAction func btnCancel(sender: AnyObject) {
        // Do nothing, just return to the MainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCategoryPicker.delegate = self
        myCategoryPicker.dataSource = self
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        tbxDateFrom.text = dateFormatter.stringFromDate(myDatePicker.date)
        tbxDateTo.text = dateFormatter.stringFromDate(myDatePicker.date)
        
        mySelector.selectedSegmentIndex = 0
        
        myOperator.selectedSegmentIndex = 0
        
        tbxMoneyAmount.text = ""
        
        myCategoryPicker.selectRow(0, inComponent: 0, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
