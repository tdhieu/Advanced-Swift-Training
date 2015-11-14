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
//    var node1: SKSpriteNode = SKSpriteNode(color: UIColor.redColor(), size: CGSize(width: 100, height: 100))
    var node1: SKSpriteNode = SKSpriteNode(imageNamed: "angrybird.png")  
    var node2: SKSpriteNode = SKSpriteNode(color: UIColor.whiteColor(), size: CGSize(width: 100, height: 100))
    var moved: Bool = false
    
    enum vatthe:UInt32 { // gom nhom cac node
        case node1 = 1
        case node2 = 2
    }
    
/*
    vi du enum:
    enum vatthe:UInt32 { // gom nhom cac node
        case maybay = 1
        case quaivat = 2
        case dan = 4
    }
*/
    
    // ------------------------- Xu ly phuong thuc ------------------------//
    
    override func didMoveToView(view: SKView) {
        
        physicsWorld.contactDelegate = self
        
        
        //---------------------- Node1 ------------------------------------//
        node1.position = CGPoint(x: 180, y: 180)
        self.addChild(node1)
//        node1.physicsBody = SKPhysicsBody(rectangleOfSize: node1.size)
        node1.size = CGSize(width: 100, height: 100)
        node1.physicsBody = SKPhysicsBody(texture: node1.texture!, size: node1.size)
        node1.physicsBody?.dynamic = true // de hai doi tuong co va cham voi nhau thi dynamic cua mot trong 2 phai bang true
        node1.physicsBody?.affectedByGravity = false // khong bi anh huong boi luc hut
        node1.name = "conchim"
        node1.physicsBody?.categoryBitMask = vatthe.node1.rawValue  // toi la so 1
        node1.physicsBody?.contactTestBitMask = vatthe.node2.rawValue  // toi co the va cham voi so 2

        //---------------------- Node2 ------------------------------------//
        node2.position = CGPoint(x: 300, y: 300)
        self.addChild(node2)
        node2.physicsBody = SKPhysicsBody(rectangleOfSize: node2.size)
        node2.physicsBody?.dynamic = true
        node2.physicsBody?.affectedByGravity = false
        node2.name = "hinhvuong"
        node2.physicsBody?.categoryBitMask = vatthe.node2.rawValue  // toi la so 2
        node2.physicsBody?.contactTestBitMask = vatthe.node1.rawValue  // toi co the va cham voi so 1
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = touch.locationInNode(self)
            
            if moved == false {
                if nodeAtPoint(location).name == "conchim" { // Xac dinh doi tuong duoc chon tren man hinh
                    moved = true
                    node1.position = location
                } else {
                    print("Chua cham vao con chim")
                }
            } else {
                node1.position = location
            }
        }

    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        moved = false
    }
    
    // Ham duoc goi khi co va cham xay ra (bat ki va cham nao)
    func didBeginContact(contact: SKPhysicsContact) {
        print("Da va cham")
/*
        // Neu doi tuong va cham la doi tuong 1 thi ta remove 1 khoi parent hay khong
        if contact.bodyA.categoryBitMask == vatthe.node1.rawValue || contact.bodyB.categoryBitMask == vatthe.node1.rawValue {
            node1.removeFromParent()
        }
*/
    }
    
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
