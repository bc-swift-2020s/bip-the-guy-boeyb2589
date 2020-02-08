//
//  ViewController.swift
//  Bip The Guy
//
//  Created by Brandon Boey on 2/2/20.
//  Copyright © 2020 Brandon Boey. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    // Properties
    @IBOutlet weak var imageToPunch: UIImageView!
    
    var audioPlayer = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    // Functions
    func playSound(name: String) {
        if let sound = NSDataAsset(name: name) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("ERROR AVAudioPlayer \(error.localizedDescription)")
            }
            
        } else {
            print("ERROR")
        }
    }
    
    func animateImage() {
        let bounds = self.imageToPunch.bounds
        let shrinkvalue: CGFloat = 60
        //shrink image to punch by 60 pixels
        self.imageToPunch.bounds = CGRect(x: self.imageToPunch.bounds.origin.x + shrinkvalue, y: self.imageToPunch.bounds.origin.y + shrinkvalue, width: self.imageToPunch.bounds.size.width - shrinkvalue, height: self.imageToPunch.bounds.size.height - shrinkvalue)
        
        UIView.animate(withDuration: 0.25, delay: 0.0
            , usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: [], animations: {self.imageToPunch.bounds = bounds }, completion: nil)
    }
    
    // Actions
    @IBAction func libraryPressed(_ sender: UIButton) {
    }
    
    @IBAction func cameraPressed(_ sender: UIButton) {
    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer){
        animateImage()
        playSound(name: "punchSound")
    }
}

