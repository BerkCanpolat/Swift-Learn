//
//  Route.swift
//  Yummie
//
//  Created by Berk Canpolat on 28.01.2025.
//

import Foundation

enum Route {
    static let baseUrl = "https://yummie.glitch.me/"
    
    case temp
    
    var description: String {
        switch self {
        case .temp: return "/temp"
        }
    }
}
