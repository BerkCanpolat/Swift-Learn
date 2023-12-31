//
//  WebService.swift
//  QuizApp
//
//  Created by Berk Canpolat on 30.12.2023.
//

import Foundation

class WebService {
    static let shared = WebService()
    
    private init() {}
    
    func getQuestions(completion: @escaping (ResponseModel?) -> Void) {
        let url = URL(string: "https://quiz-68112-default-rtdb.firebaseio.com/quiz.json")
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if error != nil {
                print(error?.localizedDescription)
                completion(nil)
            } else {
                do {
                    let result = try! JSONDecoder().decode(DataModel.self, from: data!)
                    completion(result.data)
                } catch {
                    print(error.localizedDescription)
                    completion(nil)
                }
            }
        }.resume()
    }
}
