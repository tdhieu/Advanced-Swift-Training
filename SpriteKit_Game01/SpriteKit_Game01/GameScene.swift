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
    var nodeMonster: SKSpriteNode!
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
            
        }

    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = touch.locationInNode(self)
            nodeGunship.position.y = location.y
        }
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        // Neu doi tuong va cham la monster thi ta remove monster va bullet ra khoi parent
        if contact.bodyA.categoryBitMask == vatthe.nodeMonster.rawValue || contact.bodyB.categoryBitMask == vatthe.nodeMonster.rawValue {
            nodeMonster.removeFromParent()
            nodeBullet.removeFromParent()
        }
    }
    
    var timerCreateMonster:CFTimeInterval = 0
    
    func CreateMonster() {
        
        // ------------------- Node Monster --------------------//
        let number = random(1, max: 7)
        nodeMonster = SKSpriteNode(imageNamed: "monster\(number).png")  // quai vat
        nodeMonster.position = CGPoint(x: random(self.size.width*0.3, max: self.size.width*0.7), y: self.size.height)
        nodeMonster.size = CGSize(width: 50, height: 50)
        nodeMonster.physicsBody = SKPhysicsBody(texture: nodeMonster.texture!, size: nodeMonster.size)
        nodeMonster.physicsBody?.dynamic = true
        nodeMonster.physicsBody?.affectedByGravity = false
        nodeMonster.name = "Monster"
        nodeMonster.physicsBody?.categoryBitMask = vatthe.nodeMonster.rawValue
        nodeMonster.physicsBody?.contactTestBitMask = vatthe.nodeBullet.rawValue
        self.addChild(nodeMonster)
        
        let moveDown:SKAction = SKAction.moveToY(0, duration: 2)
        let removeNode:SKAction = SKAction.removeFromParent()
//        let actionBySequence = SKAction.sequence([moveDown, removeNode])
//        
//        nodeMonster.runAction(actionBySequence)
        nodeMonster.runAction(moveDown)
        // monster sau khi di chuyen xong se bi xoa di
        nodeMonster.runAction(moveDown, completion: {
            self.nodeMonster.runAction(removeNode)
        })
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        print(currentTime)
        timerCreateMonster += currentTime
        if timerCreateMonster >= 100000 {
            CreateMonster()
            timerCreateMonster = 0
        }
    }
}
