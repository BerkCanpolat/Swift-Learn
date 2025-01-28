//
//  ApiResponse.swift
//  Yummie
//
//  Created by Berk Canpolat on 28.01.2025.
//

import Foundation

struct ApiResponse<T:Decodable>:Decodable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
