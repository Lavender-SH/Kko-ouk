//
//  StartViewController.swift
//  kku-ouk love1
//
//  Created by 이윤지 on 2023/03/10.
//

import UIKit
import Lottie
import AVFoundation

class StartViewController: UIViewController {
//fingerprint,
    
    @IBOutlet weak var statButton: UIButton!
    
    
    
    
    
    @IBOutlet weak var title1: UILabel!
    
    
    @IBOutlet weak var title2: UILabel!
    
    @IBOutlet weak var eggImage: UIImageView!
    
    
    
    
    
    
    
    // AVAudioPlayer 객체 선언
        var audioPlayer: AVAudioPlayer?
    
    
    let animationView: LottieAnimationView = {
    let animationView: LottieAnimationView = .init(name: "greenfinger")
    return animationView
    }()
    
//    let animationView2: LottieAnimationView = {
//    let animationView2: LottieAnimationView = .init(name: "touch")
//    return animationView2
//    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
  
        view.addSubview(statButton)
    
        settingLottie()
        settingTitleLabels()
        
        // animationView2의 zPosition을 statButton의 zPosition보다 작은 값으로 설정
          
        func settingTitleLabels() {
            // title1과 title2 레이블 생성 및 설정
//            title1.translatesAutoresizingMaskIntoConstraints = false
//            title1.font = UIFont.boldSystemFont(ofSize: 35)
//            title1.text = "키오스크 연습 어플"
//            view.addSubview(title1)
//
//            title2.translatesAutoresizingMaskIntoConstraints = false
//            title2.font = UIFont.boldSystemFont(ofSize: 55)
//            title2.text = "꾸-욱"
//            view.addSubview(title2)
//
           
        }
        
        func settingLottie() {
            
        
//
//                    animationView2.contentMode = .scaleAspectFit
//                    animationView2.loopMode = .loop
//                    animationView2.play()
//                    view.addSubview(animationView2)
//
//                    NSLayoutConstraint.activate([
//                    animationView2.topAnchor.constraint(equalTo: view.topAnchor, constant: 480),
//                    animationView2.heightAnchor.constraint(equalToConstant: 150),
//                    animationView2.widthAnchor.constraint(equalToConstant: 150),
//                    animationView2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//                   // animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//
//
//                    ])
//                    animationView2.translatesAutoresizingMaskIntoConstraints = false

                    
            
            
            
//            eggImage.contentMode = .scaleAspectFit
//            eggImage.translatesAutoresizingMaskIntoConstraints = false
//            view.addSubview(eggImage)
//
//            NSLayoutConstraint.activate([
//                eggImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
//                eggImage.bottomAnchor.constraint(equalTo: title1.topAnchor, constant: -25),
//                eggImage.heightAnchor.constraint(equalToConstant: 150),
//                eggImage.widthAnchor.constraint(equalToConstant: 150),
//                eggImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            ])
        }

    }

    
    func setting(){
       // self.view.backgroundColor = UIColor(red: 0.92, green: 0.75, blue: 0.49, alpha: 1.00)
        
        //UIColor(red: 0.97, green: 0.85, blue: 0.58, alpha: 1.00)
        
        //UIColor(red: 0.95, green: 0.78, blue: 0.49, alpha: 1.00)
        //UIColor(red: 0.97, green: 0.85, blue: 0.58, alpha: 1.00)
        
        //UIColor(red: 0.92, green: 0.75, blue: 0.49, alpha: 1.00)
        
        //UIColor(red: 1.00, green: 0.94, blue: 0.62, alpha: 1.00)
        self.statButton.backgroundColor = .clear
        //
        //        let eggimage = UIImage(named: "egg")
        //                let beggimage = UIImageView(image: eggimage)
        //        eggimage.contentMode = .scaleAspectFill
        //        eggimage.frame = view.bounds
        //                view.addSubview(eggimage)
        //                view.sendSubviewToBack(eggimage)
  

    }
    
    @IBAction func startedButtion(_ sender: UIButton) {

        
        // 소리 파일 URL 가져오기
                guard let url = Bundle.main.url(forResource: "introSound", withExtension: "mp3") else {
                    print("Error: Failed to find sound file.")
                    return
                }

                do {
                    // AVAudioPlayer 객체 초기화
                    audioPlayer = try AVAudioPlayer(contentsOf: url)
                    audioPlayer?.prepareToPlay()

                    // 소리 재생
                    audioPlayer?.play()

                } catch let error {
                    print("Error: Failed to play sound with \(error.localizedDescription)")
                    return
                }

                // 화면 전환 코드
                guard let controller = storyboard?.instantiateViewController(withIdentifier: "HomeNC") as? UINavigationController else {
                    print("Error: Failed to load view controller from storyboard.")
                    return
                }

                controller.modalPresentationStyle = .fullScreen
                controller.modalTransitionStyle = .flipHorizontal
                present(controller, animated: true, completion: nil)
            }
        
        
        
        
        
    

}



//
//        animationView.contentMode = .scaleAspectFit
//        animationView.loopMode = .loop
//        animationView.play()
//        view.addSubview(animationView)
//        animationView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            animationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -20),
//            animationView.heightAnchor.constraint(equalToConstant: 200),
//            animationView.widthAnchor.constraint(equalToConstant: 200),
//            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            animationView.bottomAnchor.constraint(equalTo: statButton.topAnchor, constant: -20)
      //  ])

    

    

        
        
        
//        animationView2.contentMode = .scaleAspectFit
//        animationView2.loopMode = .loop
//        animationView2.play()
//        view.addSubview(animationView2)
//
//        NSLayoutConstraint.activate([
//        animationView2.topAnchor.constraint(equalTo: view.topAnchor, constant: 450),
//        animationView2.heightAnchor.constraint(equalToConstant: 230),
//        animationView2.widthAnchor.constraint(equalToConstant: 230),
//        animationView2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//       // animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//
//
//        ])
//        animationView2.translatesAutoresizingMaskIntoConstraints = false

        
        
