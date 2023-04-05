//
//  MunuCollectionViewCell.swift
//  kku-ouk love1
//
//  Created by 이윤지 on 2023/03/05.
//

import UIKit
import PanModal


class MunuCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var menuImageView: UIImageView!
    
    @IBOutlet weak var titleLB: UILabel!
    
    @IBOutlet weak var engtitleLB: UILabel!
    
    @IBOutlet weak var detailLB: UILabel!
    
    @IBOutlet weak var priceLB: UILabel!
    
    @IBOutlet weak var addPulsButton: UIButton!
    
    
  
    func setup(with menuData: MenuData) {
        menuImageView.image = menuData.image
        titleLB.text = menuData.title
        engtitleLB.text = menuData.engtitle
        detailLB.text = menuData.detail
        priceLB.text = {
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            return numberFormatter.string(from: NSNumber(value: menuData.price)) ?? "\(menuData.price)"
        }()
    }

    
    
    @IBAction func onPlusButtonClicked(_ sender: UIButton) {
        
        print("menucollectioncell - onModalBtncliked()")
        //let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CustomBottomSheet")as! CustomBottomSheet
        //self.inputViewController?.presentPanModal(vc)
        
    }
}



