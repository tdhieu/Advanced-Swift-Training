//
//  GameScene.swift
//  AdvSpriteKit_TouchPad_Lab05
//
//  Created by Tran Duc Hieu on 11/21/15.
//  Copyright (c) 2015 Tran Duc Hieu. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var khung:SKSpriteNode = SKSpriteNode(imageNamed: "outer.png")
    var dieukhien:SKSpriteNode = SKSpriteNode(imageNamed: "inner.png")
    var maybay:SKSpriteNode = SKSpriteNode(imageNamed: "plane.png")
    
    var StartX:CGFloat!
    var StartY:CGFloat!
    
    override func didMoveToView(view: SKView) {
        backgroundColor = SKColor.whiteColor()
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        addChild(khung)
        khung.position = CGPoint(x: 0, y: -200)
        
        addChild(dieukhien)
        dieukhien.position = khung.position
        
        StartX = dieukhien.position.x
        StartY = dieukhien.position.y

        addChild(maybay)
        maybay.position = CGPoint(x: 0, y: 200)
        maybay.size = CGSize(width: maybay.size.width/6, height: maybay.size.height/6)
        
        khung.alpha = 0.4
        dieukhien.alpha = 0.4
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = touch.locationInNode(self)

            //            dieukhien.position = location
            let v = CGVector(dx: location.x - khung.position.x, dy: location.y - khung.position.y)
            
            // Tinh atan cua goc
            let angle = atan2(v.dx, v.dy)
            print(angle)
            
            // Chuyen atan ve goc
            let deg = angle * CGFloat( 180 / M_PI )
            print(deg)
            
            let length:CGFloat = khung.size.height / 2
            
            let xDist:CGFloat = sin(angle) * length
            let yDist:CGFloat = cos(angle) * length
            
            if CGRectContainsPoint(khung.frame, location) {
                dieukhien.position = location
            } else {
                dieukhien.position = CGPointMake(khung.position.x + xDist, khung.position.y + yDist)
            }
            maybay.zRotation = -(angle)
        }
    }
   
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let actionMove:SKAction = SKAction.moveTo(khung.position, duration: 0.2)
//        actionMove.timingMode = SKActionTimingMode.EaseOut
        
        dieukhien.runAction(actionMove)
    }
    
    override func update(currentTime: CFTimeInterval) {
        let y = (StartY - dieukhien.position.y) / 20
        let x = (StartX - dieukhien.position.x) / 20
        maybay.position = CGPointMake(maybay.position.x - x, maybay.position.y - y)
    }
}
