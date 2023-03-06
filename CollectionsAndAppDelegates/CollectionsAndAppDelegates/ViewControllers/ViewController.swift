//
//  ViewController.swift
//  CollectionsAndAppDelegates
//
//  Created by GDJ on 2023-02-23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblOption1: UILabel!
    @IBOutlet var lblOption2: UILabel!
    @IBOutlet var lblOption3: UILabel!
    @IBOutlet var lblOption4: UILabel!
    
    @IBAction func unwindToHome(sender: UIStoryboardSegue) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        
        lblTitle.text = mainDelegate.title
        lblOption1.text = mainDelegate.options[0]
        lblOption2.text = mainDelegate.options[1]
        lblOption3.text = mainDelegate.options[2]
        lblOption4.text = mainDelegate.options[3]
        
    }


}

