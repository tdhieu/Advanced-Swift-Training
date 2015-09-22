//
//  ViewController.swift
//  jsonADV-xcode6
//
//  Created by Tran Duc Hieu on 9/22/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var arrND:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        
        var urlJSON: NSURL = NSURL(string: "http://khoapham.vn/KhoaPhamTraining/laptrinhios/jSON/demo2.json")!
        
        // Open connection to url
        let session: NSURLSession = NSURLSession.sharedSession()
        
        var task = session.dataTaskWithURL(urlJSON, completionHandler: { (data, response, error) -> Void in
            // Ket qua url co bi loi hay ko, ney co loi thi print loi
            if (error != nil) {
                println(error)
            } else {
                // tao bien jSonResult de luu gia tri cua json, json se tra ve kieu du lieu la NSDictionary
                
                let jSonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
                
                // lay du lieu tu Dictionary ra theo key
                println(jSonResult)
                println(jSonResult["monhoc"])
                println(jSonResult["noihoc"])
                println(jSonResult["website"])
                println(jSonResult["fanpage"])
                println(jSonResult["logo"])
            }
        })
        task.resume()
        
        
        urlJSON = NSURL(string: "http://caphesinhvien.com/app-music/song.json")!
        task = session.dataTaskWithURL(urlJSON, completionHandler: { (data, response, error) -> Void in
            // Ket qua url co bi loi hay ko, ney co loi thi print loi
            if (error != nil) {
                println(error)
            } else {
                // tao bien jSonResult de luu gia tri cua json, json se tra ve kieu du lieu la NSDictionary
                
                let jSonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
                
                // lay du lieu tu Dictionary ra theo key
                println(jSonResult)
                
                var numberOfElement:Int? = jSonResult["song"]?.count
                
                for i in 0...numberOfElement! - 1 {
                    self.arrND.append(jSonResult["song"]?[i]["item_song"] as! String)
                }
                    
            }

        })
        task.resume()
        sleep(1)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

