//
//  Pg2ViewController.swift
//  CollectionsAndAppDelegates
//
//  Created by GDJ on 2023-02-24.
//

import UIKit

class Pg2ViewController: UIViewController {
    
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblScore: UILabel!
    @IBOutlet var lblTime: UILabel!
    @IBOutlet var lblLevel: UILabel!
    @IBOutlet var lblHighScore: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        
        lblTitle.text = mainDelegate.title
        lblScore.text = mainDelegate.scores["Score"]
        lblTime.text = mainDelegate.scores["Time"]
        lblLevel.text = mainDelegate.scores["Level"]
        lblHighScore.text = mainDelegate.scores["High"]
        
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
