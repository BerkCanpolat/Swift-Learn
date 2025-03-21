//
//  NewsViewModel.swift
//  NewsAppProgramatic
//
//  Created by Berk Canpolat on 21.03.2025.
//

import Foundation

struct NewsViewModel {
    let news: News
    
    var author: String {
        return news.author ?? "Unknown"
    }
    
    var title: String {
        return news.title ?? ""
    }
    
    var description: String {
        return news.description ?? ""
    }
    
    var url: String {
        return news.url ?? ""
    }
    
    var urlToImage: String {
        return news.urlToImage ?? "https://images.pexels.com/photos/19085454/pexels-photo-19085454/free-photo-of-kent-sehir-bina-yapi.jpeg?auto=compress&cs=tinysrgb&w=1200&lazy=load"
    }
}
