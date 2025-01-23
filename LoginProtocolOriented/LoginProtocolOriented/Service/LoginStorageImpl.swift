//
//  LoginStorageImpl.swift
//  LoginProtocolOriented
//
//  Created by Berk Canpolat on 23.01.2025.
//

import Foundation

class LoginStorageImpl : LoginStorageServiceProtocol {
    
    private let storage = UserDefaults.standard
    
    var userAccessTokenKey: String {
        return "ACCESS_TOKEN"
    }
    
    func setUserAccessToken(token: String) {
        storage.setValue(token, forKey: userAccessTokenKey)
    }
    
    func getUserAccesstoken() -> String? {
        return storage.string(forKey: userAccessTokenKey)
    }
    
    
}
