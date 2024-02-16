//
//  ViewController.swift
//  Vodimator
//
//  Created by Darren Reely on 2/14/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hello = UILabel(frame: CGRect(x: 40, y: 60, width: 100, height: 44))
        hello.text = "Vodimator"
        hello.textColor = .red
        view.addSubview(hello)
        
        let url1 = "www.test.com"
        let url2 = "http://test.com:8080/some.php?name=meto"
        let url3 = "somelocalserver"
        let url4 = "http://D"
        let url5 = "http:// somesite.com"
        let url6 = "https://somesite.com/some.php?name=meto&pw=self"

        let testURLS = [url1, url2, url3, url4, url5, url6]
        
        for url in testURLS {
            if let _ = URL(string: url) {
                print("url is valid: \(url)")
                if url.isValidURL {
                    print("detector is valid URL")
                } else {
                    print("detector is NOT valid URL")
                }
            } else {
                print("url is NOT valid: \(url)")
            }
            print("")
        }
    }

}

