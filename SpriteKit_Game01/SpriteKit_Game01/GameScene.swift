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
    var node1: SKSpriteNode = SKSpriteNode(imageNamed: "gunship.png")  // sung ban quai vat
    var node2: SKSpriteNode = SKSpriteNode(imageNamed: "gunship.png")  // quai vat
    var node3: SKSpriteNode = SKSpriteNode(imageNamed: "gunship.png")  // dan
    
    
    // ------------------ Xu ly phuong thuc -----------------//
    override func didMoveToView(view: SKView) {
        physicsWorld.contactDelegate = self
        
        // ------------------- Node 1 --------------------//
        node1.position = CGPoint(x: 5, y: 100)
        self.addChild(node1)
        node1.size = CGSize(width: 150, height: 100)
        node1.physicsBody = SKPhysicsBody(texture: node1.texture!, size: node1.size)
        node1.physicsBody?.dynamic = true
        node1.physicsBody?.affectedByGravity = false
        node1.name = "Gunship"
    }
    
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
