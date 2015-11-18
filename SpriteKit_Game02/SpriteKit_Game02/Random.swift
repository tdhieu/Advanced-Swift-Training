//
//  Random.swift
//  SpriteKit_Game02
//
//  Created by Tran Duc Hieu on 11/18/15.
//  Copyright © 2015 Tran Duc Hieu. All rights reserved.
//

import Foundation
import SpriteKit

func random(min: CGFloat, max: CGFloat) -> CGFloat {
    return CGFloat(arc4random_uniform(UInt32(max-min+1)))+min
}

func random(min: Int, max: Int) -> Int {
    return Int(arc4random_uniform(UInt32(max-min+1)))+min
}
