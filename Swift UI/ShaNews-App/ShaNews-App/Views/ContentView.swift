//
//  ContentView.swift
//  ShaNews-App
//
//  Created by ArunSha on 17/05/21.
//

import SwiftUI

struct ContentView: View {
   @ObservedObject var newsListVm = NewsListViewModel()
    var body: some View {
        
        NavigationView{
        
            List(newsListVm.newsListViewModel){ newsModelData in

                VStack {
                    if let newsTitle = newsModelData.title {
                        Text(newsTitle)
                            .bold()
                    }
                    Spacer()
                    if let description = newsModelData.description {
                        Text(description)
                    }
                }
                
            }
            .navigationTitle("Sha News App")

        }
        
        // ViewDidLoad like UIKIT
        .onAppear{
            newsListVm.getNewsData()
        }

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
