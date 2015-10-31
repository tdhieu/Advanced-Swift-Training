//
//  ViewControllerMain.swift
//  AdvGeneralExerciseReview01
//
//  Created by Tran Duc Hieu on 10/29/15.
//  Copyright © 2015 Tran Duc Hieu. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

class ViewControllerMain: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
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

        // Do any additional setup after loading the view.
    }
    
    @IBAction func action_LogIn(sender: AnyObject) {
        
    }

    @IBAction func action_SignUp(sender: AnyObject) {
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
