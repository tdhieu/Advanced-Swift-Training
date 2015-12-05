//
//  ViewController.swift
//  DemoNode
//
//  Created by Tran Duc Hieu on 12/3/15.
//  Copyright © 2015 Tran Duc Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var txtMessage: UITextField!
    @IBOutlet weak var tbView: UITableView!
    var arrMessage:[String] = []
    let socket = SocketIOClient(socketURL: "localhost:7123")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tbView.delegate = self
        tbView.dataSource = self
        socket.connect()
        socket.on("DangNhap") { data, ack in
//            print(data[0]["dulieu"]!!)
            
            let text:String = data[0]["dulieu"]!! as! String
            self.arrMessage.append(text)
            self.tbView.reloadData()
        }

        socket.on("GuiTinNhan") { data, ack in
//            print(data[0]["tinnhan"]!!)
            
            let text:String = data[0]["tinnhan"]!! as! String
            self.arrMessage.append(text)
            self.tbView.reloadData()
        }
        tbView.reloadData()
    }

    @IBAction func btnClick(sender: AnyObject) {
        let message = txtMessage.text
        socket.emit("Click", message!)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMessage.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = arrMessage[indexPath.row]
        return cell
    }
        
    
}

