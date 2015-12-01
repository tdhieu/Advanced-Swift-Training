//
//  ViewController.swift
//  Adv_iAd_Lab01
//
//  Created by Tran Duc Hieu on 12/1/15.
//  Copyright © 2015 Tran Duc Hieu. All rights reserved.
//

import UIKit
import iAd

class ViewController: UIViewController, ADBannerViewDelegate {

    @IBOutlet weak var myiAd: ADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.canDisplayBannerAds = true
        self.myiAd.delegate = self
        self.myiAd.hidden = true
    }
    
    func load_iAd() {
        let screenBounds = UIScreen.mainScreen().bounds
        var adBannerView = ADBannerView()
        adBannerView = ADBannerView(frame: CGRectMake(0, 0, screenBounds.width, 50))
        adBannerView.center = CGPoint(x: screenBounds.width/2, y: 25)
        adBannerView.delegate = self
        view.addSubview(adBannerView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

