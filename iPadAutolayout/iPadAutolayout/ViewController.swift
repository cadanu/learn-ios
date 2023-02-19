//
//  ViewController.swift
//  iPadAutolayout
//
//  Created by GDJ on 2023-02-16.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, UITextFieldDelegate {
    
//    var data = Data()
    @IBOutlet var tfName: UITextField!
    @IBOutlet var tfEmail: UITextField!
    @IBOutlet var lblBlurb: UILabel!
    @IBOutlet var clickMeButton: UIButton!
    @IBOutlet var webView: WKWebView!
    @IBOutlet var bestWebsiteButton: UIButton!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    // decides what happens when 'Click Me' is pressed
    @IBAction func updateLabel(_ sender: Any) {
        let alert = UIAlertController(title: "Warning", message: "Are you sure you want to proceed?", preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Yes", style: .default, handler: {
            (alert: UIAlertAction!) in self.createLabel()
            self.dismiss(animated: true, completion: nil)
        });
        let noAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        
        present(alert, animated: true)
    }
    
    // the endpoint for a segue unwind (free memory)
    @IBAction func unwindToHomeViewController(_ sender: UIStoryboardSegue) {
    }
    
    // viewDidLoad - a main function
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            bestWebsiteButton.isHidden = true
            
            let link = URL(string: "https://bestsiteever.com")!
            let request = URLRequest(url: link)
            webView.load(request)
            webView.navigationDelegate = self
        }
        else {
            bestWebsiteButton.isHidden = false
            
            webView.isHidden = true
            activityIndicator.isHidden = true
        }
    }
    
    // helps the keyboard figure itself out
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    // webview functions that control the activityIndicator
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
    
    // creates a label, called by yesAction, a UIAlertAction
    func createLabel() {
        let data : Data = .init()
        data.initWithData(_name: tfName.text!, _email: tfEmail.text!)
        
        // fill label with data
        if data.saveName != "" || data.saveEmail != "" {
            lblBlurb.text = "Hi " + data.saveName! + ", of " + data.saveEmail! + "."
        }
        else {
            lblBlurb.text = "You forgot to enter required information."
        }
        
//        tfName.text = data.saveName
//        tfEmail.text = data.saveEmail
    }
    
}

