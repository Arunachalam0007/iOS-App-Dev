//
//  ViewController.swift
//  Xylophone App
//
//  Created by ArunSha on 16/03/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?

    @IBAction func btnAudio(_ sender: UIButton) {
        
        print("Button Got Pressed ",sender.title(for: .normal)!)
        sender.alpha = 0.5
        
        //GDC (Grand Central Dispatch)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            print("HI You have excuted After 0.5 Seconds")
            sender.alpha = 1
        }
        
        // Perform method for Delay after 1 sec
        perform(#selector(setOpaque), with: sender, afterDelay: 0.5)

    }
    
    @objc func setOpaque(btn:UIButton) {
        btn.alpha = 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
//    func playSound() {
//        guard let url = Bundle.main.url(forResource: "A", withExtension: "Wav") else { return }
//
//        do {
////            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
////            try AVAudioSession.sharedInstance().setActive(true)
//
//            let player = try AVAudioPlayer(contentsOf: url)
//
//            player.play()
//
//        } catch let error {
//            print(error.localizedDescription)
//        }
//    }



}

