//
//  InfoView.swift
//  Sha-BusinessCard
//
//  Created by ArunSha on 17/05/21.
//

import SwiftUI

struct InfoView: View {
    var imageName: String
    var text: String
    var body: some View {
        RoundedRectangle(cornerRadius: 60)
            .fill(Color.white)
            .frame( height: 40, alignment: .center)
            .overlay(
                HStack{
                    Image(systemName: imageName)
                        .foregroundColor(.green)
                    Text(text)
                        .font(.system(size: 20))
                }
            )
            .padding()
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(imageName: "phone.fill", text: "Hello").previewLayout(PreviewLayout.sizeThatFits)
    }
}
