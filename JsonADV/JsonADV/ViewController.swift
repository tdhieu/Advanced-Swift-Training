//
//  ViewController.swift
//  JsonADV
//
//  Created by Tran Duc Hieu on 9/22/15.
//  Copyright © 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let urlJSON: NSURL = NSURL(string: "http://khoapham.vn/KhoaPhamTraining/laptrinhios/jSON/demo2.json")!
        
        // Open connection to url
        let session: NSURLSession = NSURLSession.sharedSession()
        
/*      xcode 6:
        let task = session.dataTaskWithURL(urlJSON, completionHandler: {data, response, error -> Void in
            
            // Ket qua url co bi loi hay ko, ney co loi thi print loi
            if (error != nil) {
                print(error, "\n")
            } else {
                // tao bien jSonResult de luu gia tri cua json, json se tra ve kieu du lieu la NSDictionary
                
                let jSonResult = NSJSONSerialization
                let jSonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
                
                // lay du lieu tu Dictionary ra theo key
                println(jSonResult["monhoc"])
                println(jSonResult["noihoc"])
                println(jSonResult["website"])
                println(jSonResult["fanpage"])
                println(jSonResult["logo"])
            }
        })*/
        
        
//      xcode 7:        
        let task = session.dataTaskWithURL(urlJSON) { (data, response, error) -> Void in
            if let urlContent = data {
                do {
                    let jsonResult = try NSJSONSerialization.JSONObjectWithData(urlContent, options: NSJSONReadingOptions.MutableContainers)
                    print(jsonResult["monhoc"])
                    print(jsonResult["noihoc"])
                    print(jsonResult["website"])
                    print(jsonResult["fanpage"])
                    print(jsonResult["logo"])
                } catch {
                    print("Read json failed!!\n")
                }
            }
        }
        task?.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

