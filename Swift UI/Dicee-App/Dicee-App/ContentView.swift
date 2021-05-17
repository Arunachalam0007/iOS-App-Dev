//
//  ContentView.swift
//  Dicee-App
//
//  Created by ArunSha on 17/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            
            Image("GreenBackground")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image("DiceeLogo")
                Spacer()
                HStack {
                    DiceView(diceNo: 1)
                    DiceView(diceNo: 1)
                }.padding(.horizontal)
                Spacer()
                Button(action:{} ) {
                    Text("Roll")
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                        .padding()
                }.background(Color(.red))
            }
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DiceView: View {
    var diceNo:Int
    var body: some View {
        Image("Dice\(diceNo)")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}
