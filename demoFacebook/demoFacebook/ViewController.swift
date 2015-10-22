//
//  ViewController.swift
//  demoFacebook
//
//  Created by Tran Duc Hieu on 10/22/15.
//  Copyright © 2015 Tran Duc Hieu. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let loginButton:FBSDKLoginButton = FBSDKLoginButton()
        loginButton.center = self.view.center
        self.view.addSubview(loginButton)
        
        if((FBSDKAccessToken.currentAccessToken()) != nil){
            //They are logged in so show another view
            print("Dang login")
        }else{
            //They need to log in
            print("Chua login")
        }
    }
    
/* 
Bai tap:
Neu da login thi lay username, profile, avatar
*/

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

