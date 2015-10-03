//
//  ViewController.swift
//  FormLog-in
//
//  Created by Tran Duc Hieu on 10/1/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

/* Bai tap ve nha
Lam 1 form log-in
- 2 label, 2 text field, 1 button
- Khi chay ung dung len thi label1 va textfield 1 chay tu` trai qua phai
- ro`i den label2 va textfield2 chay tu` trai qua phai
- button tu` tren roi xuong
- Khi nhan button thi` button rot xuong 1 doan va` hien len labelChecking (noi dung: "Dang checking")
- Sau do labelChecking chay qua trai va bien mat, labelThongBao tu phai chay qua bao
- Sau cung, button tro ve vi tri ban dau
*/

// Tao hieu ung rung tren dien thoai
// import AudioToolbox
// AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))


import UIKit
import AudioToolbox

class ViewController: UIViewController {

    @IBOutlet var lblUserName: UILabel!
    @IBOutlet var txtUserName: UITextField!
    @IBOutlet var lblPass: UILabel!
    @IBOutlet var txtPass: UITextField!
    @IBOutlet var lblChecking: UILabel!
    @IBOutlet var lblSuccess: UILabel!
    @IBOutlet var btnLogin: UIButton!
    
    var orgLblUsrNamePoint: CGPoint = CGPoint()
    var orgTxtUsrNamePoint: CGPoint = CGPoint()
    var orgLblPassPoint: CGPoint = CGPoint()
    var orgTxtPassPoint: CGPoint = CGPoint()
    var orgBtnPoint: CGPoint = CGPoint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        SetInitialPosition()
        
        let numberMove:CGFloat = 10.0
        
        let moveInTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 0)
        
        UIView.animateWithDuration(1, animations: {
            self.lblUserName.frame.origin.x = self.lblUserName.frame.origin.x + numberMove
            self.txtUserName.frame.origin.x = self.txtUserName.frame.origin.x + numberMove
/*            while self.lblUserName.frame.origin.x != self.orgTxtUsrNamePoint.x {
                self.lblUserName.frame.origin.x = self.lblUserName.frame.origin.x + numberMove
            }*/
        })
    }
    
    func SetInitialPosition() {
        orgLblUsrNamePoint = lblUserName.frame.origin
        orgTxtUsrNamePoint = txtUserName.frame.origin
        
        lblUserName.frame.origin.x -= 100.0
        txtUserName.frame.origin.x -= 100.0
        
        orgLblPassPoint = lblPass.frame.origin
        orgTxtPassPoint = txtPass.frame.origin
        
        lblPass.frame.origin.x -= 100.0
        txtPass.frame.origin.x -= 100.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

