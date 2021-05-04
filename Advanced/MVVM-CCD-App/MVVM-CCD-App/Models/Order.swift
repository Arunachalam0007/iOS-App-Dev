//
//  Order.swift
//  MVVM-CCD-App
//
//  Created by ArunSha on 04/05/21.
//

import Foundation

enum CoffeeType: String,Codable {
    case Cappuccino
    case latte
    case espressino
    case SukuCaffee
}

enum CoffeeSize: String,Codable {
    case Small
    case Meidum
    case Large
}

struct Order: Codable {
    var name : String?
    var email : String?
    var type : CoffeeType?
    var size : CoffeeSize?
}
