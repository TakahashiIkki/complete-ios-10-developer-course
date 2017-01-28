//
//  ViewController.swift
//  DownloadingWebContent
//
//  Created by 一騎高橋 on 2017/01/28.
//  Copyright © 2017年 IkkiTakahashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let url = URL(string: "https://www.stackoverflow.com/") {
//            self.webView.loadRequest(URLRequest(url: url))
            let request = NSMutableURLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request as URLRequest) {
                data, response, error in
                
                if error != nil {
                    print(error ?? "error is nil")
                } else {
                    if let unwrappedData = data {
                        let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                        print(dataString)
                        DispatchQueue.main.sync(execute: { 
                            // Update UI
//                            self.webView.loadHTMLString(dataString as! String, baseURL: nil)
//                            self.webView.loadRequest(URLRequest(url: url))
                        })
                    }
                }
            }
            
            task.resume()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

