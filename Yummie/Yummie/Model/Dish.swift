//
//  Dish.swift
//  Yummie
//
//  Created by Berk Canpolat on 26.01.2025.
//

import Foundation

struct Dish : Decodable{
    let id, name, description, image:String?
    let calories:Int?
    
    var formattedCalories:String {
        return "\(calories ?? 0) Calories"
    }
}
