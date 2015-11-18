//
//  GameScene.swift
//  AdvSpriteKit_
//
//  Created by Tran Duc Hieu on 11/12/15.
//  Copyright (c) 2015 Tran Duc Hieu. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var mayBay:SKSpriteNode!
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        var aoMayBay:SKTexture = SKTexture(imageNamed: "maybay.png")
        mayBay = SKSpriteNode(texture: aoMayBay)
        mayBay.size = CGSize(width: 100, height: 100)
        mayBay.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        addChild(mayBay)
        
        mayBay.physicsBody = SKPhysicsBody(rectangleOfSize: mayBay.size)
        mayBay.physicsBody?.dynamic = true
        
        var nenDat:SKSpriteNode = SKSpriteNode(color: UIColor.brownColor(), size: CGSize(width: self.size.width, height: 30))
        
        nenDat.position = CGPoint(x: self.size.width/2, y: 100)
        addChild(nenDat)
        
        nenDat.physicsBody = SKPhysicsBody(rectangleOfSize: nenDat.size)
        nenDat.physicsBody?.dynamic = false
        
//        var actionMove:SKAction = SKAction.moveTo(CGPoint(x: 700, y: 600), duration:3)
//        mayBay.runAction(actionMove)
        
//        var actionMove:SKAction = SKAction.moveBy(CGVectorMake(200, 200), duration: 2)
//        mayBay.runAction(actionMove)
        
//        var actionScale:SKAction = SKAction.scaleTo(4, duration: 2)
//        mayBay.runAction(actionScale)
        
//        var actionRotate:SKAction = SKAction.rotateToAngle(CGFloat(30 * M_PI / 180), duration: 5)
//        mayBay.runAction(actionRotate)
        
        let actionMove:SKAction = SKAction.moveTo(CGPoint(x: 700, y: 600), duration:3)
        let actionScale:SKAction = SKAction.scaleTo(4, duration: 2)
        let actionRotate:SKAction = SKAction.rotateToAngle(CGFloat(60 * M_PI / 180), duration: 5)
        
        let actionGroup:SKAction = SKAction.group([actionMove, actionScale, actionRotate])
        let actionWait:SKAction = SKAction.waitForDuration(2)
        let actionSound:SKAction = SKAction.playSoundFileNamed("explosion-04.mp3", waitForCompletion: false)
        let actionSequence:SKAction = SKAction.sequence([actionMove, actionWait, actionScale, actionSound, actionRotate])
        
        mayBay.runAction(actionSequence)
//        mayBay.runAction(actionGroup)
        
//        mayBay.runAction(actionMove)
//        mayBay.runAction(actionScale)
//        mayBay.runAction(actionRotate)
    }
    
   
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = touch.locationInNode(self)
            mayBay.position.x = location.x
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
