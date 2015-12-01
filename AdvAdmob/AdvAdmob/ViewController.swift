//
//  ViewController.swift
//  AdvAdmob
//
//  Created by Tran Duc Hieu on 12/1/15.
//  Copyright © 2015 Tran Duc Hieu. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController {

    var googleBannerView:GADBannerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        googleBannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
        googleBannerView.adUnitID = "ca-app-pub-5034816257140015/1091643682"
        googleBannerView.rootViewController = self
        
        let req:GADRequest = GADRequest()
        googleBannerView.loadRequest(req)
        googleBannerView.frame = CGRectMake(0, 0, self.view.frame.size.width, 50)
        req.testDevices = kGADSimulatorID.testDevices   // Neu up len store nho delete do`ng na`y
        
        self.view.addSubview(googleBannerView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

