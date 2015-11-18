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
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = touch.locationInNode(self)
            let deltaY = location.y - nodeTank.position.y
            let deltaX = location.x - nodeTank.position.x
            print(deltaY/deltaX)
            let angle = atan(deltaY/deltaX) + CGFloat(90 * M_PI / 180)
            let actionRotate:SKAction = SKAction.rotateToAngle(angle, duration: 0.1, shortestUnitArc: true)
            nodeTank.runAction(actionRotate)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
