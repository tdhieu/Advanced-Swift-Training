//
//  ViewController.swift
//  AdvExtraSwift_Lab01
//
//  Created by Tran Duc Hieu on 11/26/15.
//  Copyright © 2015 Tran Duc Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var a = 122
        var b = 555
        
        print(doiViTri(&a, number2: &b))
        
        var arr:[String] = ["AAA", "BBB", "CCC"]
        
        print(themPhanTu(&arr))
    }

    func doiViTri(inout number1: Int, inout number2: Int) -> [Int]{
        let t = number1
        number1 = number2
        number2 = t
        
        return [number1, number2]
    }
    
    func themPhanTu(inout arr:[String]) -> [String] {
        arr.append("DDD")
        return arr
    }

    // Cach dung kieu du lieu Generic
    func doiViTri<T>(inout number1: T, inout number2: T) -> [T]{
        let t = number1
        number1 = number2
        number2 = t
        
        return [number1, number2]
    }

    
}

