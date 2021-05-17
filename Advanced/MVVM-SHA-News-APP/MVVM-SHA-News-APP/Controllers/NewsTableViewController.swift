//
//  NewsTableViewController.swift
//  MVVM-SHA-News-APP
//
//  Created by ArunSha on 03/05/21.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    var newsViewModel : NewsViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 200
        loadNews()
      
    }
    
    func loadNews() {
        let newsURL = "https://newsapi.org/v2/top-headlines?country=in&apiKey=8127a083c42b477e899dc3634a8a2204"
        guard let url = URL(string: newsURL) else {
            return
        }
        NewsWebService().getNewsData(url: url) {
            result in
            self.newsViewModel = NewsViewModel(articles: result)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return newsViewModel?.numberOfRowsInSection() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell") as! NewsTableViewCell
        if let article = newsViewModel?.articleAtIndex(index: indexPath.row) {
            cell.newsTitle.text =  article.title
            cell.newsDescription.text = article.description
            cell.newsImage.image = UIImage(data: article.urlData)
            cell.newsImage.contentMode = .scaleToFill
        }
        return cell
    }

}
