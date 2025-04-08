//
//  APIURLs.swift
//  UIKIT-MVVM-PROTOCOL-PROGRAMATIC
//
//  Created by Berk Canpolat on 8.04.2025.
//

import Foundation

enum APIURLs {
    static func movies (page: Int) -> String {
        "https://api.themoviedb.org/movie/popular?api_key=e112ed72df8da5c3b38e4e6579896bc6&language=en-US&page=\(page)"
    }
}
