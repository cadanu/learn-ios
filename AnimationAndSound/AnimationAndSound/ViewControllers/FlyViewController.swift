//
//  FlyViewController.swift
//  AnimationAndSound
//
//  Created by GDJ on 2023-02-21.
//

import UIKit
import AVFAudio

class FlyViewController: UIViewController {
    
    @IBOutlet var volSlider: UISlider!
    var soundPlayer: AVAudioPlayer?
    var flyLayer: CALayer?
    
    @IBAction func volDidChange(sender: UISlider) {
        soundPlayer?.volume = volSlider.value
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let asset = Bundle.main.path(forResource: "Justice", ofType: "mp3")
        let assetURL = URL(fileURLWithPath: asset!)
        self.soundPlayer = try! AVAudioPlayer.init(contentsOf: assetURL)
        self.soundPlayer?.currentTime = 0
        self.soundPlayer?.volume = volSlider.value
        self.soundPlayer?.numberOfLoops = -1
        self.soundPlayer?.play()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let flyImage = UIImage(named: "superman.png")
        flyLayer = CALayer.init()
        flyLayer?.contents = flyImage?.cgImage
        flyLayer?.bounds = CGRect(x: 0, y: 0, width: 300, height: 300)
        flyLayer?.position = CGPoint(x: 0, y: 0)
        self.view.layer.addSublayer(flyLayer!)
        
        let moveAnimation = CABasicAnimation(keyPath: "position")
//        moveAnimation.timingFunction = CAMediaTimingFunctionName(name: )
        moveAnimation.fromValue = NSValue.init(cgPoint: CGPoint(x: -150, y: 350))
        moveAnimation.toValue = NSValue.init(cgPoint: CGPoint(x: 1200, y: 0))
        
        moveAnimation.isRemovedOnCompletion = false
        moveAnimation.duration = 3.0
        moveAnimation.repeatCount = Float.infinity
        flyLayer?.add(moveAnimation, forKey: "flyBy")
        
    }
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
