//
//  Order.swift
//  Yummie
//
//  Created by Berk Canpolat on 27.01.2025.
//

import Foundation

struct Order: Decodable {
    let id: String?
    let name: String?
    let dish: Dish?
}
