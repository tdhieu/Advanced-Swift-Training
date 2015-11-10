//
//  ViewController.swift
//  MultiThread_lab01
//
//  Created by Tran Duc Hieu on 11/7/15.
//  Copyright © 2015 Tran Duc Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let queue1:dispatch_queue_t = dispatch_queue_create("thread1", DISPATCH_QUEUE_SERIAL)
//        let queue1:dispatch_queue_t = dispatch_queue_create("thread1", DISPATCH_QUEUE_CONCURRENT)
//        let queue2:dispatch_queue_t = dispatch_queue_create("thread2", DISPATCH_QUEUE_CONCURRENT)
//        let queue3:dispatch_queue_t = dispatch_get_global_queue(2, 0)
//        dispatch_set_target_queue(queue1, queue2)
        
        let queue:dispatch_queue_t = dispatch_queue_create("thread", DISPATCH_QUEUE_CONCURRENT)
        
        let max = 20000
        var count = 0

        for (var i = 1; i <= max; i++) {
                        // async bat do`ng bo: moi thread chay doc lap ko lien quan den nhau
                        // sync do`ng bo: thread sau se cho` ket qua cua thread truoc ro`i moi chay
                        // serial: chay tua`n tu tren 1 - 2 thread
                        // concurrent: chay do`ng tho`i >60 thread
            
                dispatch_async(queue, { () -> Void in
                    count++;
                    print(count)
                })
        }
        
//        for i in 0...100{
//            // async bat do`ng bo: moi thread chay doc lap ko lien quan den nhau
//            // sync do`ng bo: thread sau se cho` ket qua cua thread truoc ro`i moi chay
//            // serial: chay tua`n tu tren 1 - 2 thread
//            // concurrent: chay do`ng tho`i >60 thread
//            dispatch_async(queue1, { () -> Void in
//                print("So i la: \(i)-------------\(NSThread.currentThread())")
//                sleep(1)
//            })
//        }

//        print("Hello-----------")
//        print("Hello-----------")
//        print("Hello-----------")
//        print("Hello-----------")
//        print("Hello-----------")
//        print("Hello-----------")
//        print("Hello-----------")
//        print("Hello-----------")
//        print("Hello-----------")

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

