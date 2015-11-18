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
    var nodeBullet:SKSpriteNode!
    
    enum nodeList:UInt32 {
        case nodeTank = 1
        case nodeMonster = 2
        case nodeBullet = 3
    }
    override func didMoveToView(view: SKView) {
        nodeTank = SKSpriteNode(imageNamed: "tank.png")
        nodeTank.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        nodeTank.size = CGSize(width: 100, height: 100)
        nodeTank.physicsBody?.dynamic = true
        nodeTank.physicsBody?.affectedByGravity = false
        nodeTank.name = "tank"
        self.addChild(nodeTank)
    }
    
    func NewBullet() -> SKSpriteNode {
        let number = random(0, max: 4)
        let newBullet:SKSpriteNode = SKSpriteNode(imageNamed: "BlueTail__00\(number).png")
        newBullet.position = nodeTank.position
        newBullet.size = CGSize(width: 50, height: 50)
        newBullet.physicsBody?.dynamic = true
        newBullet.physicsBody?.affectedByGravity = false
        newBullet.physicsBody?.categoryBitMask = nodeList.nodeBullet.rawValue
        newBullet.physicsBody?.contactTestBitMask = nodeList.nodeMonster.rawValue
        newBullet.name = "bullet"
        return newBullet
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = touch.locationInNode(self)
            let deltaY = location.y - nodeTank.position.y
            let deltaX = location.x - nodeTank.position.x
            let angle = atan2(deltaY, deltaX) - CGFloat(90 * M_PI / 180)
            let actionRotate:SKAction = SKAction.rotateToAngle(angle, duration: 0.1, shortestUnitArc: true)
            nodeTank.runAction(actionRotate)
            
            nodeBullet = NewBullet()
            self.addChild(nodeBullet)
            
            let removeNode:SKAction = SKAction.removeFromParent()
            let moveByAngle:SKAction = SKAction.moveBy(CGVector(dx: deltaX, dy: deltaY), duration: 0.2)
            nodeBullet.runAction(moveByAngle, completion: {
                self.nodeBullet.runAction(removeNode)
            })
        }
    }
    
    var timerCreateMonster:CFTimeInterval = 0
    
    func CreateMonster() {
        
    }
    
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
