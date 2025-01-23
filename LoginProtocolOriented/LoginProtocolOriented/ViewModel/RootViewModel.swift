//
//  RootViewModel.swift
//  LoginProtocolOriented
//
//  Created by Berk Canpolat on 23.01.2025.
//

import Foundation

class RootViewModel {
    
    private let loginStorageService : LoginStorageServiceProtocol
    weak var output : RootViewModelProtocol?
    
    init(loginStorageService: LoginStorageServiceProtocol) {
        self.loginStorageService = loginStorageService
    }
    
    func checkLogin() {
        if let accessToken = loginStorageService.getUserAccesstoken(), !accessToken.isEmpty {
            //showMainApp()
            output?.showMainApp()
        } else {
            //showLoginApp()
            output?.showLogin()
        }
    }
}
