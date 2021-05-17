//
//  ContentView.swift
//  Dicee-App
//
//  Created by ArunSha on 17/05/21.
//

import SwiftUI

struct ContentView: View {
   @State var leftDiceNo:Int = 1
   @State  var rightDiceNo:Int = 2
    var body: some View {
        
        ZStack {
            
            Image("GreenBackground")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image("DiceeLogo")
                Spacer()
                HStack {
                    DiceView(diceNo: leftDiceNo)
                    DiceView(diceNo: rightDiceNo)
                }.padding(.horizontal)
                Spacer()
                Button(action:{
                    self.leftDiceNo = Int.random(in: 1...6)
                    self.rightDiceNo = Int.random(in: 1...6)
                } ) {
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
