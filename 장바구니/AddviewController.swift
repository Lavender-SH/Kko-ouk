//
//  AddviewController.swift
//  kku-ouk love1
//
//  Created by 이윤지 on 2023/03/10.
//

import UIKit
import AVFoundation

class AddviewController: UIViewController, UITableViewDelegate {

    //var panScrollable: UIScrollView?
    
    // AVAudioPlayer 인스턴스 선언
       var audioPlayer: AVAudioPlayer?
    
    
    @IBOutlet weak var addTableView: UITableView!
    
    @IBOutlet weak var lastTotalprice: UILabel!
    
    
   
    
    
    var displayedCartItems = [CartItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTableView.delegate = self
        addTableView.dataSource = self
        setup()
        displayedCartItems = CartItem.shared.cartItems.filter({ $0.quantity > 0 })
        setupAudioPlayer()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        addTableView.reloadData()
    }
    
    
    func setup() {
        self.view.backgroundColor = UIColor(red: 1.00, green: 0.98, blue: 0.81, alpha: 1.00)
        self.addTableView.backgroundColor = UIColor(red: 1.00, green: 0.98, blue: 0.81, alpha: 1.00)
        
    }
    
    
    func setupAudioPlayer() {
            if let soundURL = Bundle.main.url(forResource: "deleteSound", withExtension: "mp3") {
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

    
    
//    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//
//            // Create a delete action
//            let deleteAction = UITableViewRowAction(style: .destructive, title: "삭제") { [unowned self] (action, indexPath) in
//
//                // Remove the item from the cartItems array
//                CartItem.shared.cartItems.remove(at: indexPath.row)
//
//                // Remove the item from the displayedCartItems array
//                displayedCartItems = CartItem.shared.cartItems.filter({ $0.quantity > 0 })
//
//                // Reload the table view data
//                tableView.reloadData()
//            }
//
//            return [deleteAction]
//        }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "삭제") { [unowned self] (action, view, completion) in
            // Remove the item from the cartItems array
            CartItem.shared.cartItems.remove(at: indexPath.row)
            
            // Remove the item from the displayedCartItems array
            displayedCartItems = CartItem.shared.cartItems.filter({ $0.quantity > 0 })
            
            // Reload the table view data
            tableView.reloadData()
            
            completion(true)
            playSound()
        }

        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
        return swipeConfiguration
    }

    
    
} //class fullstop.



extension AddviewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CartItem.shared.cartItems.count
    }
    
    
    //...
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ADDTableViewCell", for: indexPath) as! ADDTableViewCell
        
        let cartItem = CartItem.shared.cartItems[indexPath.row]
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        let formattedPrice = formatter.string(from: NSNumber(value: cartItem.price))
        
        // Add target action for deleteButton😇
        cell.deleteButton.addTarget(self, action: #selector(deleteButtonTapped(_:)), for: .touchUpInside)
           
        
        
        cell.backgroundColor = UIColor(red: 0.90, green: 0.96, blue: 0.80, alpha: 1.00)
        cell.addTitleLB.text = cartItem.title
        cell.totalPriceLB.text = formattedPrice
        cell.totalcountLB.text = "\(cartItem.quantity)"
        
        let totalPrice = calculateTotalPrice()
        lastTotalprice.text = formatter.string(from: NSNumber(value: totalPrice))
        
        return cell
    }
    
    @objc func deleteButtonTapped(_ sender: UIButton) {
        playSound()
        guard let cell = sender.superview?.superview as? ADDTableViewCell, let indexPath = addTableView.indexPath(for: cell) else {
            return
        }
        
        // Remove the item from the cartItems array
        CartItem.shared.cartItems.remove(at: indexPath.row)
        
        // Remove the item from the displayedCartItems array
        displayedCartItems = CartItem.shared.cartItems.filter({ $0.quantity > 0 })
        
        // Reload the table view data
        addTableView.reloadData()
    }
    
    
    
    
    func calculateTotalPrice() -> Double {
            var totalPrice = 0.0
            for cartItem in displayedCartItems {
                totalPrice += Double(cartItem.price)
            }
            return totalPrice
        }
}


