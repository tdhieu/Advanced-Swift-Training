//
//  GameScene.swift
//  SpriteKit_Game02
//
//  Created by Tran Duc Hieu on 11/18/15.
//  Copyright (c) 2015 Tran Duc Hieu. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var nodeTank:SKSpriteNode!
    var nodeMonster:SKSpriteNode!
    
    enum nodeList:UInt32 {
        case nodeTank = 1
        case nodeMonster = 2
    }
    override func didMoveToView(view: SKView) {
        nodeTank = SKSpriteNode(imageNamed: "tank.png")
        nodeTank.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        nodeTank.size = CGSize(width: 100, height: 100)
        nodeTank.physicsBody?.dynamic = true
        nodeTank.physicsBody?.affectedByGravity = false
        nodeTank.physicsBody?.categoryBitMask = nodeList.nodeTank.rawValue
        nodeTank.physicsBody?.contactTestBitMask = nodeList.nodeMonster.rawValue
        nodeTank.name = "tank"
        self.addChild(nodeTank)
    }
    
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
