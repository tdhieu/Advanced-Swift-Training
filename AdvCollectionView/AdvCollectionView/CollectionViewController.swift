//
//  CollectionViewController.swift
//  AdvCollectionView
//
//  Created by Tran Duc Hieu on 10/8/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {

    var arrImage:[String] = ["dog1.png", "dog2.png","dog3.png","dog4.png","dog5.png","dog6.png","dog7.png","dog8.png"]
    
    var arrName:[String] = ["A", "B", "C", "D", "E", "F", "G", "H", "I"]
    
    var arrPrice:[Int] = [1000000, 1500000, 360000,500000, 706000, 800000, 9000000, 3100000]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return arrImage.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CollectionViewCell
        
        cell.myImage.image = UIImage(named: arrImage[indexPath.row])
        cell.lblName.text = arrName[indexPath.row]
        cell.lblPrice.text = String(arrPrice[indexPath.row])
        cell.blurView.layer.cornerRadius = 25
        cell.blurView.clipsToBounds = true
        
        
        return cell
    }

}
