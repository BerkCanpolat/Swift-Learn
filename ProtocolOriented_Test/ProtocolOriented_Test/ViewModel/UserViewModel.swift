//
//  UserViewModel.swift
//  ProtocolOriented_Test
//
//  Created by Berk Canpolat on 23.01.2025.
//

import Foundation

class UserViewModel {
    
    private let userService : UserService
    // Bu değişken sadece ulaştığında initialize edilecek
    weak var output : UserViewModelProtocol?
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    func fetchUsers() {
        userService.fetchUser { [weak self] result in
            switch result {
            case .success(let user):
                self?.output?.updateView(name: user.name, email: user.email, userName: user.username)
            case .failure(_):
                self?.output?.updateView(name: "No user", email: "user.email", userName: "user.username")
            }
        }
    }
}
