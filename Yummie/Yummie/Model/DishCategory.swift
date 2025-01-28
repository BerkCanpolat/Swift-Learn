//
//  DishCategory.swift
//  Yummie
//
//  Created by Berk Canpolat on 26.01.2025.
//

import Foundation

struct DishCategory: Decodable {
    let id,name,image:String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "title"
        case image
    }
}
