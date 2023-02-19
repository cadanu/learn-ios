//
//  BWEViewController.swift
//  iPadAutolayout
//
//  Created by GDJ on 2023-02-18.
//

import UIKit
import WebKit

class BWEViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet var webView: WKWebView!
    @IBOutlet var activityIndictor: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let link = URL(string: "https://bestsiteever.com")
        let request = URLRequest(url: link!)
        webView.load(request)
        webView.navigationDelegate = self
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
