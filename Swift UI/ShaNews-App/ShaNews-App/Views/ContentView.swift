//
//  ContentView.swift
//  ShaNews-App
//
//  Created by ArunSha on 17/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       
        NavigationView{
            List(newsData){ newsData in
                Text(newsData.newsTitle)
            }
            .navigationTitle("Sha News App")

        }

        
    }
}

//Identifiable is used to order based on Id Value and Iterate
struct NewsModel: Identifiable {
    var id: Int
    var newsTitle: String
}

let newsData = [
    NewsModel(id: 1, newsTitle: "Heading"),
    NewsModel(id: 2, newsTitle: "Flash News"),

    NewsModel(id: 3, newsTitle: "Cricket NEWS"),
    NewsModel(id: 4, newsTitle: "Movies News")


]



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
