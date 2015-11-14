//
//  GameScene.swift
//  SpriteKit_lab03
//
//  Created by Tran Duc Hieu on 11/14/15.
//  Copyright (c) 2015 Tran Duc Hieu. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
/*
    Buoc 1: them SKPhysicsContactDelegate
    Buoc 2: them physicsWorld.contactDelegate = self trong didMoveToView
    Buoc 3: hai doi tuong va cham phai co khung bao (SKPhysic)
*/
    
    // ------------------------- Khai bao bien ----------------------------//
    var node1: SKSpriteNode = SKSpriteNode(color: UIColor.redColor(), size: CGSize(width: 100, height: 100))
    var node2: SKSpriteNode = SKSpriteNode(color: UIColor.whiteColor(), size: CGSize(width: 100, height: 100))
    
    
    // ------------------------- Xu ly phuong thuc ------------------------//
    
    override func didMoveToView(view: SKView) {
        
        physicsWorld.contactDelegate = self
        
        
        //---------------------- Node1 ------------------------------------//
        node1.position = CGPoint(x: 180, y: 180)
        self.addChild(node1)
        node1.physicsBody = SKPhysicsBody(rectangleOfSize: node1.size)
        node1.physicsBody?.dynamic = true // de hai doi tuong co va cham voi nhau thi dynamic cua mot trong 2 phai bang true
        node1.physicsBody?.affectedByGravity = false // khong bi anh huong boi luc hut
        node1.physicsBody?.categoryBitMask = 1  // toi la so 1
        node1.physicsBody?.contactTestBitMask = 2  // toi co the va cham voi so 2

        //---------------------- Node2 ------------------------------------//
        node2.position = CGPoint(x: 300, y: 300)
        self.addChild(node2)
        node2.physicsBody = SKPhysicsBody(rectangleOfSize: node2.size)
        node2.physicsBody?.dynamic = true
        node2.physicsBody?.affectedByGravity = false
        node2.physicsBody?.categoryBitMask = 2  // toi la so 2
        node2.physicsBody?.contactTestBitMask = 1  // toi co the va cham voi so 1
        
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = touch.locationInNode(self)
            node1.position = location
        }

    }
    
    // Ham duoc goi khi co va cham xay ra (bat ki va cham nao)
    func didBeginContact(contact: SKPhysicsContact) {
        print("Da va cham")
        
        // Neu doi tuong va cham la doi tuong 1 thi ta remove 1 khoi parent hay khong
        if contact.bodyA.categoryBitMask == 1 || contact.bodyB.categoryBitMask == 1 {
            node1.removeFromParent()
        }
    }
    
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
