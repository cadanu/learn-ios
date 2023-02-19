//
//  WebViewController.swift
//  iPadAutolayout
//
//  Created by GDJ on 2023-02-16.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet var webView: WKWebView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    // webView functions that control the activityIndicator
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }

    // a main function
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let link = URL(string: "https://www.hackertyper.com")!
        let request = URLRequest(url: link)
        webView.load(request)
        webView.navigationDelegate = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
