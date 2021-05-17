//
//  NewsListViewModel.swift
//  ShaNews-App
//
//  Created by ArunSha on 17/05/21.
//

import Foundation

class NewsListViewModel: ObservableObject {
   @Published var newsListViewModel = [NewsViewModel] ()
    
    func getNewsData() {
        if let newsURL = URL(string: "https://newsapi.org/v2/top-headlines?country=in&apiKey=8127a083c42b477e899dc3634a8a2204"){
            let newsResource = NewsResource<NewsModel>(url: newsURL) { newsData in
                return try?  JSONDecoder().decode(NewsModel.self , from: newsData)
            }
            
            NewsWebService().loadNews(resource: newsResource) { newsModelData in
                if let newsModelData = newsModelData, let newsModelArticles = newsModelData.articles as? [Article]{
                    for newsArticle in newsModelArticles  {
                        let newsVM = NewsViewModel(newsArticle: newsArticle)
                        self.newsListViewModel.append(newsVM)
                    }
                }
            }
            
        } else {
            print("URL is not Correct Format")
            return
        }
        
    }
}

struct NewsViewModel: Identifiable {
    
    var id: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    
    init(newsArticle: Article) {
        self.id = newsArticle.id
        self.title =  newsArticle.title
        self.description = newsArticle.description
        self.url = newsArticle.url
        self.urlToImage =  newsArticle.urlToImage
        self.publishedAt = newsArticle.publishedAt
    }
    
    var imageData: Data? {
        if let urlImage = urlToImage {
            guard let imageURL = URL(string: urlImage) else { return nil }
            return try? Data(contentsOf: imageURL)
        }
        return nil
    }
}
