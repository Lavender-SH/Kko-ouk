//
//  DataModel.swift
//  kku-ouk love1
//
//  Created by 이윤지 on 2023/03/12.
//

import Foundation

class CartItem {
    
    static let shared = CartItem() // singileton 싱글톤 객체
    var title: String
    var price: Int
    var quantity: Int
    
    //private
    init() { // private init을 사용하여 외부에서 객체 생성을 막음
        self.title = "aa"
        self.price = 0
        self.quantity = 0
    }
    
    //make array
    
  //  lazy var cartItems: [CartItem] = [CartItem.shared]
    
    lazy var cartItems: [CartItem] = []
    
    
    func addCartItem(title: String, price: Int, quantity: Int) {
        let newCartItem = CartItem()
        newCartItem.title = title
        newCartItem.price = price
        newCartItem.quantity = quantity
        cartItems.append(newCartItem)
    }
    
    
} // CartItem full stop.

