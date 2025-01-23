//
//  LoginStorageService.swift
//  LoginProtocolOriented
//
//  Created by Berk Canpolat on 23.01.2025.
//

import Foundation

protocol LoginStorageServiceProtocol {
    var userAccessTokenKey : String {get}
    func setUserAccessToken(token:String)
    func getUserAccesstoken() -> String?
}
