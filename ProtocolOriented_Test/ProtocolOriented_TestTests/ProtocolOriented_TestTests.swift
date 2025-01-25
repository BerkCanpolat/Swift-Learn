//
//  ProtocolOriented_TestTests.swift
//  ProtocolOriented_TestTests
//
//  Created by Berk Canpolat on 23.01.2025.
//

import XCTest
@testable import ProtocolOriented_Test

final class ProtocolOriented_TestTests: XCTestCase {
    
    private var userViewModel : UserViewModel!
    private var userService : MockUserService!
    private var output : MockUserViewModelOutPut!
    

    override func setUpWithError() throws {
        userService = MockUserService()
        userViewModel = UserViewModel(userService: userService)
        output = MockUserViewModelOutPut()
        userViewModel.output = output
    }

    override func tearDownWithError() throws {
        userService = nil
        userViewModel = nil
    }

    func testUpdateView_whenAPISuccess_showsEmailNameUserName() throws {
        let mockUser = User(id: 1, name: "Berk", username: "Canpolat", email: "bb@gmail.com", phone: "05544 33 44", website: "berk.com")
        
        userService.fetchUserMockresult = .success(mockUser)
        userViewModel.fetchUsers()
        
        XCTAssertEqual(output.updateViewArray.first?.userName, "Canpolat")
    }
    
    func testUpdateView_whenAPIFailure_showsNoUser() throws {
        userService.fetchUserMockresult = .failure(NSError())
        userViewModel.fetchUsers()
        XCTAssertEqual(output.updateViewArray.first?.name, "No user")
        
    }
    
}

class MockUserService: UserService {
    var fetchUserMockresult : Result<ProtocolOriented_Test.User, any Error>?
    func fetchUser(completion: @escaping (Result<ProtocolOriented_Test.User, any Error>) -> Void) {
        if let result = fetchUserMockresult {
            completion(result)
        }
    }
    
    
}

class MockUserViewModelOutPut: UserViewModelProtocol {
    var updateViewArray : [(name:String, email:String,userName:String)] = []
    func updateView(name: String, email: String, userName: String) {
        updateViewArray.append((name,email,userName))
    }
    
    
}
