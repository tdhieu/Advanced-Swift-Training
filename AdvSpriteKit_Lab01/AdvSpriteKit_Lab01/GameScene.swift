//
//  GameScene.swift
//  AdvSpriteKit_Lab01
//
//  Created by Tran Duc Hieu on 11/10/15.
//  Copyright (c) 2015 Tran Duc Hieu. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var conChim:SKSpriteNode!
    
    // Similar to ViewDidLoad()
    override func didMoveToView(view: SKView) {
        self.view?.showsPhysics = true
        
        // textture is the cover for SpriteNode
        let ao:SKTexture = SKTexture(imageNamed: "angrybird.png") // texture object
        
        // SpriteNode is the displayed objects on screen
        conChim = SKSpriteNode(texture: ao)
        
        conChim.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        
        conChim.size = CGSize(width: 150, height: 150)
        
        addChild(conChim)

        // Create physic for angrybird)
        conChim.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: 150, height: 150))
//        conChim.physicsBody = SKPhysicsBody(circleOfRadius: conChim.size.width/2)
        conChim.physicsBody?.dynamic = true



        
//        let ao0:SKTexture = SKTexture(imageNamed: "Idle__000.png")
//        let ao1:SKTexture = SKTexture(imageNamed: "Idle__001.png")
//        let ao2:SKTexture = SKTexture(imageNamed: "Idle__002.png")
//        let ao3:SKTexture = SKTexture(imageNamed: "Idle__003.png")
//        let ao4:SKTexture = SKTexture(imageNamed: "Idle__004.png")
//        let ao5:SKTexture = SKTexture(imageNamed: "Idle__005.png")
//        let ao6:SKTexture = SKTexture(imageNamed: "Idle__006.png")
//        let ao7:SKTexture = SKTexture(imageNamed: "Idle__007.png")
//        let ao8:SKTexture = SKTexture(imageNamed: "Idle__008.png")
//        let ao9:SKTexture = SKTexture(imageNamed: "Idle__009.png")
        
        var arrTexture:[SKTexture] = []
        
        for i in 0...9 {
            arrTexture.append(SKTexture(imageNamed: "Run__00\(i).png"))
        }
        
//        let actionThayAo:SKAction = SKAction.animateWithTextures([ao0, ao1, ao2, ao3, ao4, ao5, ao6, ao7, ao8, ao9], timePerFrame: 0.3)
        
        let actionThayAo:SKAction = SKAction.animateWithTextures(arrTexture, timePerFrame: 0.1)
        
        let actionThayAoLienTuc:SKAction = SKAction.repeatActionForever(actionThayAo)
        
        conChim.runAction(actionThayAoLienTuc)
        
                let nodeNenDat:SKSpriteNode = SKSpriteNode(color: SKColor.brownColor(),size: CGSize(width: self.size.width, height: 50))
                nodeNenDat.position = CGPoint(x: self.size.width/2, y: 150)
                addChild(nodeNenDat)
                nodeNenDat.zRotation = (20 * CGFloat(M_PI) / 180)
                nodeNenDat.physicsBody = SKPhysicsBody(rectangleOfSize: nodeNenDat.size)
                nodeNenDat.physicsBody?.dynamic = false
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
//        for touch in touches {
//            let location = touch.locationInNode(self)
////            conChim.position = location
//            conChim.physicsBody?.velocity = CGVectorMake(0, 400)
//        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = touch.locationInNode(self)
//            conChim.position = location
            conChim.physicsBody?.velocity = CGVectorMake(100, 0)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
