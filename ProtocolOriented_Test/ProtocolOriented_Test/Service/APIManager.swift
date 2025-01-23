//
//  APIManager.swift
//  ProtocolOriented_Test
//
//  Created by Berk Canpolat on 23.01.2025.
//

import Foundation

class APIManager: UserService {
    
    /*static let shared = APIManager()
    private init() {} */
    
    func fetchUser(completion: @escaping(Result<User,Error>) -> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            DispatchQueue.main.async {
                if let user = try? JSONDecoder().decode([User].self, from: data).last {
                    completion(.success(user))
                } else {
                    completion(.failure(NSError()))
                }
            }
        }.resume()
    }
    
}
