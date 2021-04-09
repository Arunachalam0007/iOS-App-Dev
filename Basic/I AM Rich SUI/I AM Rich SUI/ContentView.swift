//
//  ContentView.swift
//  I AM Rich SUI
//
//  Created by ArunSha on 09/04/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(.systemTeal).ignoresSafeArea()
            VStack {
                Text("I'm Fan Of Suresh Raina")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .padding()
                Image("Raina")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 400, height: 500, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
