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
        
        let originWidth = self.view.frame.width
        let originHeight = self.view.frame.height
        
        let lblHoTen:UILabel = UILabel(frame: CGRectMake(originWidth/10, originHeight/15, originWidth/6, originHeight/10))
        lblHoTen.text = "Họ và tên:"
        self.view.addSubview(lblHoTen)
        
        let txtHoTen:UILabel = UILabel(frame: CGRectMake(originWidth/10 + lblHoTen.frame.width + 5, originHeight/15, originWidth * 3 / 5, originHeight/10))
        txtHoTen.text = "Trần Đức Hiếu"
        self.view.addSubview(txtHoTen)

        let lblNgaySinh:UILabel = UILabel(frame: CGRectMake(originWidth/10, originHeight/15 + lblHoTen.frame.height + 5, originWidth/6, originHeight/10))
        lblNgaySinh.text = "Ngày sinh:"
        self.view.addSubview(lblNgaySinh)
        
        let txtNgaySinh:UILabel = UILabel(frame: CGRectMake(originWidth/10 + lblNgaySinh.frame.width + 5, originHeight/15 + lblHoTen.frame.height + 5, originWidth * 3 / 5, originHeight/10))
        txtNgaySinh.text = "25/07/1988"
        self.view.addSubview(txtNgaySinh)
        
        let lblEmail:UILabel = UILabel(frame: CGRectMake(originWidth/10, originHeight/15 + lblNgaySinh.frame.height + 5, originWidth/6, originHeight/10))
        lblEmail.text = "Email:"
        self.view.addSubview(lblEmail)
        
        let txtEmail:UILabel = UILabel(frame: CGRectMake(originWidth/10 + lblNgaySinh.frame.width + 5, originHeight/15 + lblNgaySinh.frame.height + 5, originWidth * 3 / 5, originHeight/10))
        txtEmail.text = "tranduchieu@gmail.com"
        self.view.addSubview(txtEmail)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

