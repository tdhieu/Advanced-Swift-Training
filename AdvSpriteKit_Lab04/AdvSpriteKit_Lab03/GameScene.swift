//
//  GameScene.swift
//  AdvSpriteKit_Lab03
//
//  Created by Tran Duc Hieu on 11/17/15.
//  Copyright (c) 2015 Tran Duc Hieu. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    override func didMoveToView(view: SKView) {
//        print(random(50, max: 60))
        
        // Random ra vi tri man hinh trong khoang 10% - 90% chieu rong man hinh
//        print(random(self.size.width * 0.1, max: self.size.width * 0.9))
        
        var node:SKSpriteNode = SKSpriteNode(color: UIColor.redColor(), size: CGSize(width: 100, height: 100))
        node.position = CGPoint(x: 200, y: 300)
        addChild(node)
        
        
        // Ve duong thang cho node
//        var path = UIBezierPath()
//        path.moveToPoint(CGPointZero)
//        path.addLineToPoint(CGPoint(x: 0, y: 200))
//        path.addLineToPoint(CGPoint(x: 200, y: 200))
//        path.addLineToPoint(CGPoint(x: 200, y: 0))
////        path.addLineToPoint(CGPointZero)
//        path.closePath()
//        
//        var actionMove:SKAction = SKAction.followPath(path.CGPath, duration: 3)
//        
//        var actionRepeat:SKAction = SKAction.repeatActionForever(actionMove)
//        node.runAction(actionRepeat)

        
        // Ve duong cong cho node
        var path = UIBezierPath()
        path.moveToPoint(CGPointZero)
        path.addCurveToPoint(CGPoint(x: 500, y: 0), controlPoint1: CGPoint(x: 200, y: 0), controlPoint2: CGPoint(x: 700, y: 600))
        path.closePath()
        
        var actionMove:SKAction = SKAction.followPath(path.CGPath, duration: 3)
        node.runAction(actionMove)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
//        for touch in touches {
//            let location = touch.locationInNode(self)
//            
//            let sprite = SKSpriteNode(imageNamed:"Spaceship")
//            
//            sprite.xScale = 0.5
//            sprite.yScale = 0.5
//            sprite.position = location
//            
//            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
//            
//            sprite.runAction(SKAction.repeatActionForever(action))
//            
//            self.addChild(sprite)
//        }
    }
   
//    var timerCreateMonster:CFTimeInterval = 0
//    
//    func CreateMonster() {
//        
//    }
    
    // Co the dung ham update de quan ly thay cho timer, neu su dung nhieu timer se gay ra lag ung dung
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
//        timerCreateMonster += currentTime
//        if timerCreateMonster >= 3000000 {
//            CreateMonster()
//            timerCreateMonster = 0
//        }
        
        
    }
}
