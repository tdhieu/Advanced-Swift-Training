//
//  libSupport.swift
//  AdvSpriteKit_Lab03
//
//  Created by Tran Duc Hieu on 11/17/15.
//  Copyright © 2015 Tran Duc Hieu. All rights reserved.
//

import Foundation
import SpriteKit

// Ham random nay tu viet de xac dinh gia tri random nam trong 1 khoang min - max nao do
func random(min: CGFloat, max: CGFloat) -> CGFloat {
    return CGFloat(arc4random_uniform(UInt32(max-min+1))) + min
}

func random(min: Int, max: Int) -> Int {
    return Int(arc4random_uniform(UInt32(max-min+1))) + min
}
