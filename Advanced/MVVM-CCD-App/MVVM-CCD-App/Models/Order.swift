//
//  Order.swift
//  MVVM-CCD-App
//
//  Created by ArunSha on 04/05/21.
//

import Foundation

enum CoffeeType: String,Codable, CaseIterable {
    case cappuccino
    case latte
    case espressino
    case SukuCaffee
}

enum CoffeeSize: String,Codable, CaseIterable {
    case Small
    case Medium
    case Large
}

struct Order: Codable {
    var name : String?
    var email : String?
    var type : CoffeeType?
    var size : CoffeeSize?
}
