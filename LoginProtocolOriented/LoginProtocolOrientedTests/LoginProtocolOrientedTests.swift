//
//  LoginProtocolOrientedTests.swift
//  LoginProtocolOrientedTests
//
//  Created by Berk Canpolat on 23.01.2025.
//

import XCTest
@testable import LoginProtocolOriented

final class LoginProtocolOrientedTests: XCTestCase {
    
    private var viewModel : RootViewModel!
    private var loginStrageService : MockLoginStorageService!
    private var output : MockRootViewModelProtocol!

    override func setUpWithError() throws {
        loginStrageService = MockLoginStorageService()
        viewModel = RootViewModel(loginStorageService: loginStrageService)
        output = MockRootViewModelProtocol()
        
        viewModel.output = output
    }

    override func tearDownWithError() throws {
        viewModel = nil
        loginStrageService = nil
    }

    func testShowLogin_whenLoginStorageReturnsEmptyUserAccessToken() throws {
        loginStrageService.storage = [:]
        viewModel.checkLogin()
        
        XCTAssertEqual(output.check.first, .login)
    }
    
    func testShowMainApp_whenLoginStorageReturnsUserAccessToken() throws {
        
        loginStrageService.storage["ACCESS_TOKEN"] = "12312412rfvcxcv123"
        viewModel.checkLogin()
        
        XCTAssertEqual(output.check.first, .mainApp)
        
    }

}

class MockLoginStorageService  : LoginStorageServiceProtocol{
    var userAccessTokenKey: String {
        return "ACCESS_TOKEN"
    }
    
    var storage : [String: String] = [:]
    
    func setUserAccessToken(token: String) {
        storage[userAccessTokenKey] = token
    }
    
    func getUserAccesstoken() -> String? {
        return storage[userAccessTokenKey]
    }
}


class MockRootViewModelProtocol : RootViewModelProtocol {
    
    enum Check {
        case login
        case mainApp
    }
    
    var check : [Check] = []
    
    func showLogin() {
        check.append(.login)
    }
    
    func showMainApp() {
        check.append(.mainApp)
    }
    
    
}
