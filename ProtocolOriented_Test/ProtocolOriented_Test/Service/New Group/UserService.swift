//
//  UserService.swift
//  ProtocolOriented_Test
//
//  Created by Berk Canpolat on 23.01.2025.
//

import Foundation

protocol UserService {
    func fetchUser(completion: @escaping(Result<User,Error>) -> Void)
}
