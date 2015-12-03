//
//  ViewController.swift
//  DemoNode
//
//  Created by Tran Duc Hieu on 12/3/15.
//  Copyright © 2015 Tran Duc Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtMessage: UITextField!
    @IBOutlet weak var tbView: UITableView!
    let socket = SocketIOClient(socketURL: "localhost:7123")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        socket.connect()
        socket.on("DangNhap") { data, ack in
            print(data[0]["dulieu"]!!)
        }

        socket.on("GuiTinNhan") { data, ack in
            print(data[0]["tinnhan"]!!)
        }
    }

    @IBAction func btnClick(sender: AnyObject) {
        let message = txtMessage.text
        socket.emit("Click", message!)
    }
    
    
}

