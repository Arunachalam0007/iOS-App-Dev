//
//  NewsViewModel.swift
//  MVVM-SHA-News-APP
//
//  Created by ArunSha on 04/05/21.
//

import Foundation
struct NewsViewModel {
    let articles: [Article]
}
extension NewsViewModel {
    
    func numberOfRowsInSection () -> Int {
       return articles.count
    }
    
    func articleAtIndex(index: Int) -> NewsArticleViewModel {
        let article = articles[index]
        return NewsArticleViewModel(article)
    }
    
}


// NewsArticleVM contain Single Article
struct NewsArticleViewModel {
    private var article: Article
}

extension NewsArticleViewModel {
    
    init(_ article: Article) {
        self.article = article
    }
    
    var title : String {
        return article.title
    }
    
    var description : String {
        return article.description
    }
    
    var urlData : Data {
        
        var urlImageData = Data()
        if let url = URL(string: article.urlToImage), let data = try? Data(contentsOf: url){
            urlImageData =  data
        }
        return urlImageData
    }
    
}
