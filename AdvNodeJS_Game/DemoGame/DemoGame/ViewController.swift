//
//  ViewController.swift
//  DemoGame
//
//  Created by Tran Duc Hieu on 12/5/15.
//  Copyright © 2015 Tran Duc Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let socket: SocketIOClient = SocketIOClient(socketURL: "localhost:7123")
    
    @IBOutlet weak var myImage: UIImageView!
    
    var player:CGFloat = 1
    var arrPlayers:[CGFloat] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        socket.connect()
        myImage.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: "Move"))
        myImage.userInteractionEnabled = true
        
        socket.on("Vitri") { toado, ack in
//            print(toado)
            var toado = toado[0]["vitri"]!! as! [CGFloat]
            if toado[2] != arrPlayers {
                print(toado)
            }
        }
    }

    func Move(recognizer: UIPanGestureRecognizer){
        let translation = recognizer.translationInView(self.view)
        recognizer.view!.center = CGPoint(x: recognizer.view!.center.x + translation.x, y: recognizer.view!.center.y + translation.y)
        recognizer.setTranslation(CGPointZero, inView: self.view)
        
        let toaDoX:CGFloat = recognizer.view!.center.x + translation.x
        let toaDoY:CGFloat = recognizer.view!.center.y + translation.y
        socket.emit("Move", [toaDoX, toaDoY, player])
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

