//
//  VariedViewController.swift
//  AnimationAndSound
//
//  Created by GDJ on 2023-02-21.
//

import UIKit
import AVFoundation

class VariedViewController: UIViewController {
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var pictureSegControl: UISegmentedControl!
    @IBOutlet var musicSegControl: UISegmentedControl!
    var soundPlayer: AVAudioPlayer!
    var imageLayer: CALayer!
    
    @IBAction func sliderVolume(sender: UISlider) {
        soundPlayer?.volume = slider.value
    }
    @IBAction func controlPicture(sender: UISegmentedControl) {
        let alert = UIAlertController(title: "Info", message: pictureSegControl.)
        
    }
    @IBAction func controlMusic(sender: UISegmentedControl) {
    }

    override func viewWillAppear(_ animated: Bool) {
        let asset = Bundle.main.path(forResource: "HEROICCC", ofType: "mp3")
        let assetURL = URL(fileURLWithPath: asset!)
        soundPlayer? = try! AVAudioPlayer.init(contentsOf: assetURL)
        soundPlayer?.currentTime = 0
        soundPlayer?.volume = slider.value
        soundPlayer?.numberOfLoops = -1
        soundPlayer?.play()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
