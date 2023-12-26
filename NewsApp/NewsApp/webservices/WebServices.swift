//
//  WebServices.swift
//  NewsApp
//
//  Created by Berk Canpolat on 26.12.2023.
//

import Foundation


class WebServices {
    
    static let shared = WebServices()
    
    private init() {}
    
    func fetchNews(completion: @escaping ([Model]?) -> Void) {
        
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&apiKey=31616581584b40e7a785477827989051"
        if let url = URL(string: urlString) {
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error?.localizedDescription)
                } else {
                    
                    do {
                        //JSON verilerini MODEL dizisine dönüştürüyoruz
                        let result = try JSONDecoder().decode(NewsResponse.self, from: data!)
                        completion(result.articles)
                        
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                }
            }
            
        }
        
    }
    
}
