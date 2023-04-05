//
//  CustomBottomSheet.swift
//  kku-ouk love1
//
//  Created by 이윤지 on 2023/03/06.
//
import Foundation
import UIKit
import PanModal
import AVFoundation


class CustomBottomSheet: UITableViewController {

    @IBOutlet weak var cartTitle: UILabel!
    
    @IBOutlet weak var titleLBbottom: UILabel!
    //가격
    @IBOutlet weak var priceLBbottom: UILabel!
    
    @IBOutlet weak var wonLB: UILabel!
    
    @IBOutlet weak var totalLB: UILabel!
    
    //🐶 입력갯수
    @IBOutlet weak var countLB: UILabel!
    
    @IBOutlet weak var gaeLB: UILabel!
    
    @IBOutlet weak var addtoCartPage: UIButton!
    
    
    @IBOutlet weak var stepper: UIStepper!
    
    
    // AVAudioPlayer 인스턴스 선언
       var audioPlayer: AVAudioPlayer?
    var audioPlayeraADD: AVAudioPlayer?
    
    //🌷
    let stepperValueChanged: Int = 0
    var sum: Int = 0
    let countlb: String = ""
    var senderVaule: Int = 1
    
    var index: Int = 0 {
        didSet {
            sum = MenuData.MenuDATAS[index].price
        }
    }
    
    
    
    //⭐️ let sum
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        playSound()
        let price = MenuData.MenuDATAS[index].price     //🔴
      
        sum = Int(sender.value) * price
        print("\(sum)원 입니다.")
        
        countLB.text = Int(sender.value).description
        priceLBbottom.text = String(sum)
        
        senderVaule  = Int(sender.value)
 }
    
    
    
    
   
  //  var index: Int = 0
    var collectMemuData: [MenuData] = []
    var quantity: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectMemuData = MenuData.MenuDATAS
        stepperSetup()
        updatePriceLabel()
        addtocartButtonSetup()
        setupAudioPlayer()
        setupAudioPlayerBox()
        setupAudioPlayerADD()
    }
    
    func addtocartButtonSetup() {
        self.addtoCartPage.layer.masksToBounds = false
        self.addtoCartPage.layer.cornerRadius = 5
    }
    
    
//    func bottomsetup(with menuData: MenuData){
//        titleLBbottom.text = menuData.title
//        priceLBbottom.text = String(menuData.price)
//    }
    
    
    func bottomsetup(with menuData: MenuData) {
        titleLBbottom.text = menuData.title
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        if let formattedPrice = numberFormatter.string(from: NSNumber(value: menuData.price)) {
            priceLBbottom.text = formattedPrice
        } else {
            priceLBbottom.text = "\(menuData.price)"
        }
    }

    
    
    func stepperSetup() {
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.minimumValue = 1
        stepper.maximumValue = 15
        stepper.value = 1
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
    
    func setupAudioPlayerBox() {
            if let soundURL = Bundle.main.url(forResource: "boxSound", withExtension: "mp3") {
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

        func playSoundBox() {
            audioPlayer?.play()
        }
    
    
   func setupAudioPlayerADD(){
        if let soundURL = Bundle.main.url(forResource: "addtocartSound", withExtension: "mp3") {
            do {
                audioPlayeraADD = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayeraADD?.prepareToPlay()
            } catch let error {
                print("error initializing AVAudioPlayer: \(error.localizedDescription)")
            }
        } else {
            print("error: sound file not found")
        }
    }

    func playSoundADD() {
        audioPlayeraADD?.play()
    }
    
    
    
    
    var cartItems: [CartItem] = []
    
    @IBAction func addtoCartPageSELELTED(_ sender: UIButton) {
        playSound()
        print("버튼이 눌림")
        
        print("메뉴: \(MenuData.MenuDATAS[index].title), 총가격: \(sum), 총갯수:  \(senderVaule) 장바구니에 담았습니다." )
        
        // performSegue(withIdentifier: "nextVC", sender: self)
        
        //   sender.isEnabled = false // 버튼 비활성화

        CartItem.shared.title = MenuData.MenuDATAS[index].title
        CartItem.shared.price = sum
        CartItem.shared.quantity = senderVaule
       
        let cartItem = CartItem.shared
        //cartItem.addCartItem(title: MenuData.MenuDATAS[index].title, price: sum, quantity: senderVaule)
        
        cartItem.addCartItem(title: MenuData.MenuDATAS[index].title, price: sum, quantity: senderVaule)
        
        print("메뉴: \(CartItem.shared.title), 총가격: \(CartItem.shared.price), 총갯수:  \(CartItem.shared.quantity) 장바구니에 담았습니다람쥐.")
        
        print("메뉴: \(cartItem.cartItems.last?.title ?? ""), 총가격: \(cartItem.cartItems.last?.price ?? 0), 총갯수:  \(cartItem.cartItems.last?.quantity ?? 0) 장바구니에 담았습니집에갈래.")
        
        let new = CartItem.shared.price
        
        let insertResult = new
        tableView.reloadData() // 테이블 뷰 리로드
        
        if (insertResult != nil) {
            // 저장이 성공한 경우 알림 메시지를 표시
            let alert = UIAlertController(title: "장바구니에 담겼습니다. \n 오른쪽 맨위 빨간색 카트 그림을 눌러 확인하세요.", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { [weak self] action in
                self?.dismiss(animated: true, completion: nil)
                // bottomSheetViewController를 dismiss 하여 화면에서 내려가도록 합니다.
                self?.playSoundADD()
            }))
            
            present(alert, animated: true, completion: nil)
            
        } else {
            // 저장이 실패한 경우 알림 메시지를 표시
            let alert = UIAlertController(title: "저장에 실패하였습니다.", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        
        sender.isEnabled = true // 버튼 다시 활성화
    }
    
} // class CustomBottomSheet stop


extension CustomBottomSheet: PanModalPresentable {
    var panScrollable: UIScrollView? {
        return tableView
    }
    
    var shortFormHeight: PanModalHeight {
        return .contentHeight(200)
    }
    
    var longFormHeight: PanModalHeight {
        return .maxHeightWithTopInset(40)
        
    }
    
    func calculatePrice(for quantity: Int) -> Double {
        let basePrice = 10.0
        let pricePerItem = 2.0
        return basePrice + (Double(quantity) * pricePerItem)
    }
    
    func updatePriceLabel() {
        let price = calculatePrice(for: quantity)
        priceLBbottom.text = String(format: "A", price)
    }
}




