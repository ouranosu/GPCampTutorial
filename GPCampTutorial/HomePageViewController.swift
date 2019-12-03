//
//  HomePageViewController.swift
//  GPCampTutorial
//
//  Created by work on 2019/11/21.
//  Copyright © 2019 Masahiro Okura. All rights reserved.
//

import UIKit
import WebKit
import IBAnimatable

class HomePageViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {

    //Outlet
    @IBOutlet weak var WebView: WKWebView!
    @IBOutlet weak var Indicator: AnimatableActivityIndicatorView!
    
    private let urlString: String = "https://greenpark-santo.com/"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        WebView.navigationDelegate = self
        WebView.uiDelegate = self
        guard let url = URL(string: urlString) else { return }
        let req = URLRequest(url: url,
                             cachePolicy: .returnCacheDataElseLoad,
                             timeoutInterval: 100)
        self.WebView.load(req)
    }
    
    @IBAction func back(_ sender: Any) {
        WebView.goBack()
    }
    
    
    @IBAction func next(_ sender: Any) {
        WebView.goForward()
    }
    
    
    @IBAction func reload(_ sender: Any) {
        WebView.reload()
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        Indicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        Indicator.stopAnimating()
    }
}
