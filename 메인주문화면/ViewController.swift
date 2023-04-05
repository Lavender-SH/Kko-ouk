//
//  ViewController.swift
//  kku-ouk love1
//
//  Created by 이윤지 on 2023/03/05.
//

import UIKit
import PanModal
import AVFoundation

class ViewController: UIViewController, PanModalPresentable {
    var panScrollable: UIScrollView?
    // var currentPage = 0
   // var menuData: [MenuData] = MenuData.MenuDATAS // default menu data

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var hotButton: UIButton!
    
    @IBOutlet weak var iceButton: UIButton!

    @IBOutlet weak var teaButton: UIButton!

    @IBOutlet weak var dessertButton: UIButton!
    
    
    @IBOutlet weak var naviCartButton: UIBarButtonItem!
    
    
    
    // AVAudioPlayer 인스턴스 선언
       var audioPlayer: AVAudioPlayer?
    var audioPlayer2: AVAudioPlayer?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // 기존의 네비게이션 바 버튼에 액션 추가
               // navigationItem.rightBarButtonItem?.action = #selector(Item)
                
        
       hotmenuSetting()
        //setRadius()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        //MunuCollectionViewCell.addPlusButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
        print("ViewController - onModalBtncliked()")
        setupAudioPlayer()
        setupAudioPlayer2()
        
    }
    
 
    //배경색등등 세팅하기
    func hotmenuSetting() {
        //백그라운드 배경색 (연녹색)
        self.view.backgroundColor = UIColor(red: 0.90, green: 0.96, blue: 0.80, alpha: 1.00)
        //컬렉션뷰 배경색
        self.collectionView.backgroundColor =  UIColor(red: 0.90, green: 0.96, blue: 0.80, alpha: 1.00)
    }

    func setupAudioPlayer() {
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

        func playSound() {
            audioPlayer?.play()
        }

    func setupAudioPlayer2() {
            if let soundURL = Bundle.main.url(forResource: "ActionLipSound2", withExtension: "mp3") {
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

        func playSound2() {
            audioPlayer2?.play()
        }
    
   
    
    @IBAction func iceButtonPressed(_ sender: UIButton) {
//        menuData = IceMenuData.MenuDATAS // set ice menu data
//               collectionView.reloadData() // reload collection view with new data
        
    }
    
    @IBAction func naviCartSELETEDbutton(_ sender: UIBarButtonItem) {
        playSound2()
    }
    
 } //class stop
    
    
    
    extension ViewController: UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return MenuData.MenuDATAS.count
 }
        
 func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
   
     
     let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "MunuCollectionViewCell", for: indexPath) as! MunuCollectionViewCell
            cell.setup(with: MenuData.MenuDATAS[indexPath.row])
            cell.backgroundColor =  UIColor(red: 1.00, green: 0.98, blue: 0.81, alpha: 1.00)
            cell.layer.cornerRadius = 10
            cell.layer.masksToBounds = true
            return cell
        }
 }
    
    
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (collectionView.frame.width - 35) / 2 // 가로 방향으로 2개의 셀이 보이도록 함
        return CGSize(width: cellWidth, height: 250)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
}

    
    
    
   extension ViewController: UICollectionViewDelegate{
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            //매뉴 클릭시 프린트🎯
            playSound()

            print(MenuData.MenuDATAS[indexPath.row].title)
            print("메뉴를 선택했습니다()")
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CustomBottomSheet")as! CustomBottomSheet
            //        presentPanModal(PanModalPresentable.LayoutType, sourceView: UITableView, sourceRect: CGRect)
            vc.index = indexPath.item
            self.presentPanModal(vc)
            
            
            
            vc.bottomsetup(with: MenuData.MenuDATAS[indexPath.row])
            
            
            
            
            //  vc.num = indexPath.row  🫧
  }
        
    } //extension stop
    
    
    
    
//
//extension ViewController {
//
//    func setupAudioPlayer() {
//            if let soundURL = Bundle.main.url(forResource: "ActionLipSound2", withExtension: "mp3") {
//                do {
//                    audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
//                } catch let error {
//                    print("error initializing AVAudioPlayer: \(error.localizedDescription)")
//                }
//            }
//        }
//
//
//}




//    func setRadius(){
//        //버튼둥글게 하기
//        self.hotButton.layer.masksToBounds = false
//        self.hotButton.layer.cornerRadius = 10
//        self.iceButton.layer.masksToBounds = false
//        self.iceButton.layer.cornerRadius = 10
//        self.teaButton.layer.masksToBounds = false
//        self.teaButton.layer.cornerRadius = 10
//        self.dessertButton.layer.masksToBounds = false
//        self.dessertButton.layer.cornerRadius = 10
//
//        //버튼.텍스트 두줄이상 개행하기
//        self.hotButton.setTitle("Hot \n따뜻한 커피", for: .normal)
//        self.hotButton.titleLabel?.lineBreakMode = .byWordWrapping
//        self.hotButton.titleLabel?.textAlignment = .center
//        self.iceButton.setTitle("Ice \n차가운 커피", for: .normal)
//        self.iceButton.titleLabel?.lineBreakMode = .byWordWrapping
//        self.iceButton.titleLabel?.textAlignment = .center
//        self.teaButton.setTitle("Tea \n차", for: .normal)
//        self.teaButton.titleLabel?.lineBreakMode = .byWordWrapping
//        self.teaButton.titleLabel?.textAlignment = .center
//        self.dessertButton.setTitle("Dessert \n디저트", for: .normal)
//        self.dessertButton.titleLabel?.lineBreakMode = .byWordWrapping
//        self.dessertButton.titleLabel?.textAlignment = .center
//
//        //버튼 테두리랑 배경색 설정
//        self.iceButton.layer.borderWidth = 1
//        self.iceButton.layer.borderColor = UIColor.orange.cgColor
//        self.iceButton.layer.backgroundColor = UIColor.white.cgColor
//        self.teaButton.layer.borderWidth = 1
//        self.teaButton.layer.borderColor = UIColor.orange.cgColor
//        self.teaButton.layer.backgroundColor = UIColor.white.cgColor
//        self.dessertButton.layer.borderWidth = 1
//        self.dessertButton.layer.borderColor = UIColor.orange.cgColor
//        self.dessertButton.layer.backgroundColor = UIColor.white.cgColor
//
//
//    }
