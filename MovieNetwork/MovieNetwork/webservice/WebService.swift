//
//  WebService.swift
//  MovieNetwork
//
//  Created by Berk Canpolat on 27.12.2023.
//

import Foundation


class WebService {
    
    static let shared = WebService()
    
    private init() {}
    
    func getMovie(url:URL, completion: @escaping ([FilmModel]?) -> Void ) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                do {
                    let json = try! JSONDecoder().decode([FilmModel].self, from: data!)
                    completion(json)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
    
    func getActor(url:URL, completion: @escaping ([OyuncuModel]?) -> Void ) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                do {
                    let json = try! JSONDecoder().decode([OyuncuModel].self, from: data!)
                    completion(json)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
    
}
