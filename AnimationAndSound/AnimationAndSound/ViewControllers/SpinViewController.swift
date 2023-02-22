//
//  SpinViewController.swift
//  AnimationAndSound
//
//  Created by GDJ on 2023-02-21.
//

import UIKit
import AVFoundation

class SpinViewController: UIViewController {
    
    @IBOutlet var volSlider: UISlider!
    var soundPlayer: AVAudioPlayer?
    var spinLayer: CALayer?
    
    @IBAction func volDidChange(sender: UISlider) {
        soundPlayer?.volume = volSlider.value
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let soundURL = Bundle.main.path(forResource: "Braveheart", ofType: "mp3")
        let url = URL(fileURLWithPath: soundURL!)
        self.soundPlayer = try! AVAudioPlayer.init(contentsOf: url)
        self.soundPlayer?.currentTime = 0
        self.soundPlayer?.volume = volSlider.value
        self.soundPlayer?.numberOfLoops = -1
        self.soundPlayer?.play()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let spinImage = UIImage(named: "ship-wheel2.png")
        spinLayer = CALayer.init()
        spinLayer?.contents = spinImage?.cgImage
        
        spinLayer?.bounds = CGRect(x: 0, y: 0, width: 300, height: 300)
        spinLayer?.position = CGPoint(x: 250, y: 200)
        self.view.layer.addSublayer(spinLayer!)
        
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
//        rotateAnimation.timingFunction = CAMediaTimingFunction(name: )
        rotateAnimation.fromValue = 0
        rotateAnimation.toValue = 2 * Double.pi
        
        rotateAnimation.isRemovedOnCompletion = false
        rotateAnimation.duration = 5.0
        
        rotateAnimation.repeatCount = Float.infinity
        spinLayer?.add(rotateAnimation, forKey: "defaultSpin")
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.soundPlayer?.stop()
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    override func didReceiveMemoryWarning() {
        // clean up
    }

}
