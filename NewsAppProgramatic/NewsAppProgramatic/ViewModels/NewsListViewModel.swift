//
//  NewsListModel.swift
//  NewsAppProgramatic
//
//  Created by Berk Canpolat on 21.03.2025.
//

import Foundation

class NewsListViewModel {
    var newsVM = [NewsViewModel]()
    
    let reuseID = "news"
    
    func getNews(completion: @escaping ([NewsViewModel]) -> Void) {
        NetworkManager.shared.getNews { (news) in
            guard let news = news else { return }
            let newsVM = news.map(NewsViewModel.init)
            DispatchQueue.main.async {
                self.newsVM = newsVM
                completion(newsVM)
            }
        }
    }
}
