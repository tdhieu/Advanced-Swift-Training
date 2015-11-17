//
//  GameScene.swift
//  SpriteKit_Game01
//
//  Created by Tran Duc Hieu on 11/14/15.
//  Copyright (c) 2015 Tran Duc Hieu. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    // ------------------ Khai bao bien -------------------//
    var nodeGunship: SKSpriteNode = SKSpriteNode(imageNamed: "gunship.png")  // sung ban quai vat
    var nodeMonster: SKSpriteNode = SKSpriteNode(imageNamed: "monster1.png")  // quai vat
    var arrBullet:[SKSpriteNode] = []
    var nodeBullet: SKSpriteNode!
    var moved: Bool = false
    
    enum vatthe:UInt32 {
        case nodeGunship = 3
        case nodeMonster = 2
        case nodeBullet = 1
    }
    
    
    // ------------------ Xu ly phuong thuc -----------------//
    override func didMoveToView(view: SKView) {
        
        physicsWorld.contactDelegate = self
        
        // ------------------- Node Gunship --------------------//
        nodeGunship.position = CGPoint(x: 50, y: 500)
        self.addChild(nodeGunship)
        nodeGunship.size = CGSize(width: 150, height: 100)
        nodeGunship.physicsBody = SKPhysicsBody(texture: nodeGunship.texture!, size: nodeGunship.size)
        nodeGunship.physicsBody?.dynamic = true
        nodeGunship.physicsBody?.affectedByGravity = false
        nodeGunship.name = "Gunship"
        nodeGunship.physicsBody?.categoryBitMask = vatthe.nodeGunship.rawValue

        // ------------------- Node Monster --------------------//
        nodeMonster.position = CGPoint(x: 200, y: 500)
        nodeMonster.size = CGSize(width: 100, height: 100)
        nodeMonster.physicsBody = SKPhysicsBody(texture: nodeMonster.texture!, size: nodeMonster.size)
        nodeMonster.physicsBody?.dynamic = true
        nodeMonster.physicsBody?.affectedByGravity = false
        nodeMonster.name = "Monster"
        nodeMonster.physicsBody?.categoryBitMask = vatthe.nodeMonster.rawValue
        nodeMonster.physicsBody?.contactTestBitMask = vatthe.nodeBullet.rawValue
        self.addChild(nodeMonster)

    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // ------------------- Node Bullet --------------------//
        nodeBullet = SKSpriteNode(imageNamed: "angrybird.png")  // dan
        arrBullet.append(nodeBullet)
        nodeBullet.size = CGSize(width: 50, height: 50)
        nodeBullet.position = nodeGunship.position
        nodeBullet.physicsBody = SKPhysicsBody(texture: nodeBullet.texture!, size: nodeBullet.size)
        nodeBullet.physicsBody?.dynamic = true
        nodeBullet.physicsBody?.affectedByGravity = false
        nodeBullet.name = "Bullet"
        nodeBullet.physicsBody?.categoryBitMask = vatthe.nodeBullet.rawValue
        nodeBullet.physicsBody?.contactTestBitMask = vatthe.nodeMonster.rawValue
        self.addChild(nodeBullet)

        for touch in touches {
            let location = touch.locationInNode(self)
            let moveToPosition:SKAction = SKAction.moveTo(location, duration: 0.5)
            let removeNode:SKAction = SKAction.removeFromParent()
            let actionBySequence = SKAction.sequence([moveToPosition, removeNode])

            nodeBullet.runAction(actionBySequence)
            // bullet sau khi lam xong action 1 se bi xoa di
//            nodeBullet.runAction(moveToPosition, completion: {
//                self.nodeBullet.runAction(removeNode)
//                
//            })
        }

    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        var nodeBullet:SKSpriteNode = arrBullet[0]
//        nodeBullet.removeFromParent()
//        arrBullet.removeAtIndex(0)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = touch.locationInNode(self)
            nodeGunship.position.y = location.y
        }
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        // Neu doi tuong va cham la monster thi ta remove monster ra khoi parent
        if contact.bodyA.categoryBitMask == vatthe.nodeMonster.rawValue || contact.bodyB.categoryBitMask == vatthe.nodeMonster.rawValue {
            nodeMonster.removeFromParent()
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
