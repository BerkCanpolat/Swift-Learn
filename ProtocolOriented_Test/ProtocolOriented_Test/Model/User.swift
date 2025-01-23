//
//  User.swift
//  ProtocolOriented_Test
//
//  Created by Berk Canpolat on 23.01.2025.
//

import Foundation

struct User:Codable {
    let id:Int
    let name, username, email:String
    let phone, website:String
}
