//
//  FadeViewController.swift
//  AnimationAndSound
//
//  Created by GDJ on 2023-02-21.
//

import UIKit
import AVFoundation

class FadeViewController: UIViewController {
    
    @IBOutlet var volSlider: UISlider!
    var soundPlayer: AVAudioPlayer?
    var fadeLayer: CALayer?
    
    @IBAction func volDidChange(_ sender: UISlider) {
        soundPlayer?.volume = volSlider.value
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let asset = Bundle.main.path(forResource: "keysofmoon-immense", ofType: "mp3")
        let assetURL = URL(fileURLWithPath: asset!)
        soundPlayer = try! AVAudioPlayer.init(contentsOf: assetURL)
        soundPlayer?.currentTime = 0
        soundPlayer?.volume = volSlider.value
        soundPlayer?.numberOfLoops = -1
        soundPlayer?.play()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let fadeImage = UIImage(named: "ufo.png")
//        fadeLayer = CALayer.init()
//        fadeLayer?.contents = fadeImage?.cgImage
//        fadeLayer?.bounds = CGRect(x: 0, y: 0, width: 300, height: 300)
//        fadeLayer?.position = CGPoint(x: 450, y: 270)
//        self.view.layer.addSublayer(fadeLayer!)
//
//        let fadeAnimation = CABasicAnimation(keyPath: "opacity")
////        fadeAnimation.timingFunction = CAMediaTimingFunction(name: )
//        fadeAnimation.fromValue = NSNumber.init(value: 1.0)
//        fadeAnimation.toValue = NSNumber.init(value: 0.0)
//        fadeAnimation.isRemovedOnCompletion = false
//        fadeAnimation.duration = 3.0
//        fadeAnimation.beginTime = 1.0
//        fadeAnimation.isAdditive = false
////        fadeAnimation.fillMode =
//        fadeAnimation.repeatCount = Float.infinity
//        fadeLayer?.add(fadeAnimation, forKey: "defaultFade")
        
        animateMe()
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    func animateMe() {
        let fadeImage = UIImage(named: "ufo.png")
        fadeLayer = CALayer.init()
        fadeLayer?.contents = fadeImage?.cgImage
        fadeLayer?.bounds = CGRect(x: 0, y: 0, width: 300, height: 300)
        fadeLayer?.position = CGPoint(x: 450, y: 270)
        self.view.layer.addSublayer(fadeLayer!)

        let fadeAnimation = CABasicAnimation(keyPath: "opacity")
        fadeAnimation.fromValue = NSNumber.init(value: 1.0)
        fadeAnimation.toValue = NSNumber.init(value: 0.0)
        fadeAnimation.isRemovedOnCompletion = false
        fadeAnimation.duration = 3.0
        fadeAnimation.beginTime = 1.0
        fadeAnimation.isAdditive = false
        fadeAnimation.repeatCount = Float.infinity
        fadeLayer?.add(fadeAnimation, forKey: "defaultFade")
    }

}
