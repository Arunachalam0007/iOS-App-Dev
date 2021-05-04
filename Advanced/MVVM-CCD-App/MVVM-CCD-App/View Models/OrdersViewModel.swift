//
//  OrderViewModel.swift
//  MVVM-CCD-App
//
//  Created by ArunSha on 04/05/21.
//

import Foundation

struct OrdersViewModel {
    let orders: [Order]
}

extension OrdersViewModel {
    func numberOfRowsInSection() -> Int {
        return orders.count
    }
    func orderAtIndex(index: Int) -> OrderViewModel {
        return OrderViewModel(orders[index])
    }
}

class OrderViewModel {
    let order : Order
    init(_ order: Order) {
        self.order = order
    }
}

extension OrderViewModel {
    var name : String {
        guard let orderName = order.name else {
            return ""
        }
        return orderName
    }
    
    var email : String {
        guard let orderEmail = order.email else {
            return ""
        }
        return orderEmail
    }
    
    var type : String {
        guard let coffeeType = order.type else {
            return ""
        }
        return coffeeType.rawValue
    }
    
    var size : String {
        guard let coffeeSize = order.size else {
            return ""
        }
        return coffeeSize.rawValue
    }
    
}
