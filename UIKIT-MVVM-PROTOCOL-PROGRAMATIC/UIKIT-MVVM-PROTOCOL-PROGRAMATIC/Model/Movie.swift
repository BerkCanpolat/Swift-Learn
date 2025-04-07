//
//  Movie.swift
//  UIKIT-MVVM-PROTOCOL-PROGRAMATIC
//
//  Created by Berk Canpolat on 7.04.2025.
//

import Foundation

struct Movie: Decodable {
    let results: [MovieResult]?
}


struct MovieResult: Decodable {
    let id: Int?
    let posterPath: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
    }
}
