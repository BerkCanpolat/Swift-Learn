//
//  Data.swift
//  OOPCollectionAndTableView
//
//  Created by Berk Canpolat on 26.05.2024.
//

import Foundation


class Movies {
    let image:String
    
    init(image: String) {
        self.image = image
    }
}

class Categories {
    let name:String
    let movies:[Movies]
    
    init(name: String, movies: [Movies]) {
        self.name = name
        self.movies = movies
    }
}
