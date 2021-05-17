//
//  DiceView.swift
//  Dicee-App
//
//  Created by ArunSha on 17/05/21.
//

import SwiftUI

struct DiceView: View {
    var diceNo:Int
    var body: some View {
        Image("Dice\(diceNo)")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}
