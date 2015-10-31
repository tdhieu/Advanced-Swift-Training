//
//  ViewController.swift
//  CollectionViewShopItem
//
//  Created by Tran Duc Hieu on 10/29/15.
//  Copyright © 2015 Tran Duc Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var arrSectionImages:[String] = []
    var arrItemImages:[[String]] = []
    var arrItemContents:[[String]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return arrSectionImages.count
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrItemImages[section].count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CellItem", forIndexPath: indexPath) as! CollectionViewCell
        cell.cellItem_Image = UIImageView(image: UIImage(named: arrItemImages[indexPath.section][indexPath.row]))
        cell.cellItem_Label.text = arrItemContents[indexPath.section][indexPath.row]
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let cellHeader = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "CellHeader", forIndexPath: indexPath) as! CollectionViewHeader
        cellHeader.cellHeader_Image = UIImageView(image: UIImage(named: arrSectionImages[indexPath.section]))
        return cellHeader
    }
}

