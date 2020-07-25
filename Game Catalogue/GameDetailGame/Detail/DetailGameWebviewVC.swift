//
//  DetailGameWebviewVC.swift
//  Game Catalogue
//
//  Created by Amin faruq on 12/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import UIKit
import WebKit

class DetailGameWebviewVC: UIViewController {
    var myProgressView: UIProgressView!

    var theBool: Bool!
    var myTimer: Timer?
    var urlWeb : String?
    var webView : WKWebView!
    
    override func loadView() {
        let url = URL(string: urlWeb ?? "")
        webView = WKWebView()
        webView.load(URLRequest(url: url!))
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.tintColor = UIColor.red
    }
    
   
}
