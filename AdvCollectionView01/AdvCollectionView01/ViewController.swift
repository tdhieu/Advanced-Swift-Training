//
//  ViewController.swift
//  AdvCollectionView01
//
//  Created by Tran Duc Hieu on 10/27/15.
//  Copyright © 2015 Tran Duc Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var myCollectionView: UICollectionView!

    var arrND:[[String]] = [["Ao1", "Ao2", "Ao3", "Ao4", "Ao5"], ["Quan1", "Quan2", "Quan3"], ["Phu kien 1", "Phu kien 2", "Phu kien 3", "Phu kien 4"]]
    var arrNhom:[String] = ["Nhom1", "Nhom2", "Nhom3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return arrNhom.count;
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrND[section].count;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CellSP
        cell.CellSP_myView.backgroundColor = UIColor(red: 0.2, green: 0.3, blue: 0.1, alpha: 1)
        cell.CellSP_Title.text = arrND[indexPath.section][indexPath.row]
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let reusable_cell = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "CellHeader", forIndexPath: indexPath) as! ReusableSP
        reusable_cell.reusable_title.text = arrNhom[indexPath.section]
        return reusable_cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

