//
//  SuccessViewController.swift
//  kku-ouk love1
//
//  Created by 이윤지 on 2023/03/10.
//

import UIKit
import Lottie
import AVFoundation


class SuccessViewController: UIViewController {

    let animationView: LottieAnimationView = {
    let animationView: LottieAnimationView = .init(name: "clap")
    return animationView
    }()
    
    // AVAudioPlayer 인스턴스 선언
       var audioPlayer: AVAudioPlayer?
    var audioPlayer2: AVAudioPlayer?
    
    @IBOutlet weak var finishLB: UILabel!
    
    
    @IBOutlet weak var returnButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudioPlayerSuccess()
        playSoundSuccess()
        seting()
        settingLottie()
        setupAudioPlayerReturn()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        playSoundSuccess()
    }
    
    
    
    func seting(){
        self.view.backgroundColor = UIColor(red: 0.98, green: 0.88, blue: 0.87, alpha: 1.00)
        
    }
    
    func settingLottie(){
        // animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
        animationView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
        animationView.heightAnchor.constraint(equalToConstant: 360),
        animationView.widthAnchor.constraint(equalToConstant: 360),
        animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
       // animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        finishLB.topAnchor.constraint(equalTo: animationView.bottomAnchor, constant: -70)
        ])
        animationView.translatesAutoresizingMaskIntoConstraints = false
        finishLB.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    
    func setupAudioPlayerSuccess() {
            if let soundURL = Bundle.main.url(forResource: "successSound", withExtension: "mp3") {
                do {
                    audioPlayer2 = try AVAudioPlayer(contentsOf: soundURL)
                    audioPlayer2?.prepareToPlay()
                } catch let error {
                    print("error initializing AVAudioPlayer: \(error.localizedDescription)")
                }
            } else {
                print("error: sound file not found")
            }
        }

        func playSoundSuccess() {
            audioPlayer2?.play()
        }

    func setupAudioPlayerReturn() {
            if let soundURL = Bundle.main.url(forResource: "ActionLipSound", withExtension: "mp3") {
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                    audioPlayer?.prepareToPlay()
                } catch let error {
                    print("error initializing AVAudioPlayer: \(error.localizedDescription)")
                }
            } else {
                print("error: sound file not found")
            }
        }

        func playSoundReturn() {
            audioPlayer?.play()
        }
    
    
    @IBAction func returnPressed(_ sender: UIButton) {
        playSoundReturn()
        
    }
    
    

}
