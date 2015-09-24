//
//  ViewController.swift
//  registerADV
//
//  Created by Tran Duc Hieu on 9/24/15.
//  Copyright © 2015 Duy-Hieu. All rights reserved.
//

// Bai tap: tao cac doi tuong sau bang code, co kich thuoc lay ti le tuong doi theo kich thuoc man hinh
// de khong bi thay doi vi tri hay bien dang khong hop ly khi xoay thiet bi
// 1 label "Ho Ten" - 1 textview
// 1 label "Ngay Sinh" - 1 textview
// 1 label "Email" - 1 textview
// 1 button nam giua man hinh

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var lblHoTen:UILabel = UILabel(frame: CGRectMake(10, 20, 200, 200))
        lblHoTen.text = "Hello"
        self.view.addSubview(lblHoTen)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

