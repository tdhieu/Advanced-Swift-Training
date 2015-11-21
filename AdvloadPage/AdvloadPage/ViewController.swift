//
//  ViewController.swift
//  AdvloadPage
//
//  Created by Tran Duc Hieu on 11/21/15.
//  Copyright © 2015 Tran Duc Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var swiftPageView: SwiftPages!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        var VCIDs:[String] = ["TrangChu", "DienThoai", "MayTinh", "PhuKien"]
//        var buttonTitles: [UIImage] = [UIImage(named: "Home")!, UIImage(named: "Phone")!, UIImage(named: "Laptop")!, UIImage(named: "Accessories")!]
//
//        swiftPageView.setOriginY(40.0)
//        swiftPageView.enableAeroEffectInTopBar(true)
//        swiftPageView.setTopBarBackground(UIColor.whiteColor())
//        swiftPageView.setAnimatedBarColor(UIColor.whiteColor())
//        swiftPageView.initializeWithVCIDsArrayAndButtonTitlesArray(VCIDs, buttonTitlesArray: buttonTitles)

        
        var VCIDs:[String] = ["TrangChu", "DienThoai", "MayTinh", "PhuKien"]
        var buttonImages: [UIImage] = [UIImage(named: "home.png")!, UIImage(named: "phone.png")!, UIImage(named: "laptop.png")!, UIImage(named: "accessories.png")!]
        
        swiftPageView.setOriginY(0.0)
        swiftPageView.initializeWithVCIDsArrayAndButtonImagesArray(VCIDs, buttonImagesArray: buttonImages)
        swiftPageView.setTopBarBackground(UIColor(red: 244/255, green: 164/255, blue: 96/255, alpha: 1.0))
        swiftPageView.setAnimatedBarColor(UIColor(red: 255/255, green: 250/255, blue: 205/255, alpha: 1.0))
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

