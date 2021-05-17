//
//  ContentView.swift
//  Sha-BusinessCard
//
//  Created by ArunSha on 17/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(UIColor(red: 0.48, green: 0.07, blue: 0.23, alpha: 1.00)).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                
                Image("ArunSha Pic")
                    .resizable() // To resize based on contentmode
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 320)
                    .clipShape(Circle()) // Place image given inside shape
                    
                Text("Arun Sha")
                    .foregroundColor(.white)
                    .font(Font.custom("Pacifico-Regular",size: 20))
                    .bold()
                    
                Text("iOS Developer")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                Divider()
                
                InfoView(imageName: "phone.fill", text: "+91 8526030805")
                InfoView(imageName: "envelope.fill", text: "arunsha0007@gmail.com")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


