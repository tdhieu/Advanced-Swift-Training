//
//  thirdViewController.swift
//  ReviewTableView
//
//  Created by Tran Duc Hieu on 9/19/15.
//  Copyright © 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class thirdViewController: UIViewController {

    @IBOutlet var imgOne: UIImageView!
    
    @IBOutlet var imgTwo: UIImageView!
    
    @IBOutlet var imgThree: UIImageView!
    
    @IBOutlet var lblResult: UILabel!
    
    var timer:NSTimer!
    
    @IBAction func startToMove(sender: AnyObject) {
        lblResult.text = ""
        timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: Selector("Move"), userInfo: nil, repeats: true)
    }
    
    func Move() {
        if imgOne.frame.origin.x + imgOne.frame.width >= self.view.frame.size.width {
            timer.invalidate()
            lblResult.text = "One wins!"
        } else if imgTwo.frame.origin.x + imgTwo.frame.width >= self.view.frame.size.width {
            timer.invalidate()
            lblResult.text = "Two wins!"
        } else if imgThree.frame.origin.x + imgThree.frame.width >= self.view.frame.size.width {
            timer.invalidate()
            lblResult.text = "Three wins!"
        } else {
            let numberMove1:CGFloat = CGFloat(arc4random_uniform(40)+20)
            UIView.animateWithDuration(1, animations: {
                self.imgOne.frame.origin.x = self.imgOne.frame.origin.x + numberMove1
            })
            
            let numberMove2:CGFloat = CGFloat(arc4random_uniform(40)+20)
            UIView.animateWithDuration(1, animations: {
                self.imgTwo.frame.origin.x = self.imgTwo.frame.origin.x + numberMove2
            })
            
            let numberMove3:CGFloat = CGFloat(arc4random_uniform(40)+20)
            UIView.animateWithDuration(1, animations: {
                self.imgThree.frame.origin.x = self.imgThree.frame.origin.x + numberMove3
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
