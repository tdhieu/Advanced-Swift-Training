//
//  myCollectionViewController.swift
//  AdvCollectionView
//
//  Created by Tran Duc Hieu on 10/8/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class myCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {


    @IBOutlet var myCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
