//
//  AddCoffeeOrderViewModel.swift
//  MVVM-CCD-App
//
//  Created by ArunSha on 05/05/21.
//

import Foundation

struct AddCoffeeOrderViewModel {
    var name: String?
    var email: String?
    var selectedCoffeeType: String?
    var selectedCoffeeSize: String?
    
    var type: [String]{
        return CoffeeType.allCases.map { cType in
            cType.rawValue.capitalized
        }
    }
    
    var size: [String]{
        return CoffeeSize.allCases.map { cSize in
            cSize.rawValue.capitalized
        }
    }
    
}


