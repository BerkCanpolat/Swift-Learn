//
//  AllDishes.swift
//  Yummie
//
//  Created by Berk Canpolat on 28.01.2025.
//

import Foundation

struct AllDishes: Decodable {
    let categories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
}
