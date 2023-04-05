//
//  MenuDatas.swift
//  kku-ouk love1
//s
//  Created by 이윤지 on 2023/03/05.
//

import UIKit

struct MenuData {
    let image: UIImage?
    let title: String
    let engtitle: String
    let detail: String
    let price: Int
    
    static let MenuDATAS: [MenuData] = [
        MenuData(image: UIImage(named: "따뜻한아메리카노.png"), title: "아메리카노", engtitle: "Americano", detail: "물이 들어갔어요", price: 1_500),
        MenuData(image: UIImage(named: "따뜻한라떼.png"), title:"라떼", engtitle: "Latte", detail: "우유가 들어갔어요!", price: 2_500),
        MenuData(image: UIImage(named: "따뜻한카푸치노.png"), title: "카푸치노", engtitle: "Cappuchino", detail: "우유 적고 거품 많아요", price: 2_700),
        MenuData(image: UIImage(named: "따뜻한카라멜라떼.png"), title: "바닐라 라떼", engtitle: "Vanlla Latte", detail: "은은하게 달달해요", price: 3_000),
        MenuData(image: UIImage(named: "따뜻한카페모카.png"), title: "카페모카", engtitle: "Cafe Mocha", detail: "초코시럽이 들어간 라떼", price: 3_000),
        MenuData(image: UIImage(named: "따뜻한바닐라라떼.png"), title: "카라멜 라떼", engtitle: "Carmel Latte", detail: "찐득하게 달달한 라떼", price: 3_000)

    ]
  
    // Format price with comma separator
       var formattedPrice: String {
           let formatter = NumberFormatter()
           formatter.numberStyle = .decimal
           formatter.locale = Locale(identifier: "ko_KR")
           return formatter.string(from: NSNumber(value: price)) ?? ""
       }
} //fullstop







struct IceMenuData {
    let image: UIImage?
    let title: String
    let engtitle: String
    let detail: String
    let price: Int
    
    
    static let MenuDATAS: [IceMenuData] = [
        IceMenuData(image: UIImage(named: "아이스아메리카노.png"), title: "아이스 아메리카노", engtitle: "Ice Americano", detail: "물과 얼음이 들어갔어요", price: 2_000),
        IceMenuData(image: UIImage(named: "아이스라떼.png"), title:"아이스 라떼", engtitle: "Ice Latte", detail: "우유가 들어갔어요!", price: 3_500),
        IceMenuData(image: UIImage(named: "아이스카푸치노.png"), title: "아이스 카푸치노", engtitle: "Ice Cappuchino", detail: "우유가 적어요(거품 많이)", price: 3_500),
        IceMenuData(image: UIImage(named: "아이스바닐라라떼.png"), title: "아이스 바닐라 라떼", engtitle: "Ice Vanlla Latte", detail: "은은하게 달달해요", price: 4_000),
        IceMenuData(image: UIImage(named: "아이스카페모카.png"), title: "아이스 카페모카", engtitle: "Ice Cafe Mocha", detail: "초코시럽이 들어간 라떼", price: 4_000),
        IceMenuData(image: UIImage(named: "아이스카라멜라떼.png"), title: "아이스 카라멜 라떼", engtitle: "Ice Carmel Latte", detail: "찐득하게 달달한 라떼", price: 4_000)
        
    ]
}


