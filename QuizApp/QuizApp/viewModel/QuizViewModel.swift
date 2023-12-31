//
//  QuizViewModel.swift
//  QuizApp
//
//  Created by Berk Canpolat on 30.12.2023.
//

import Foundation


class QuizViewModel {
    private var responseModel: ResponseModel?
    private var questionModel: [QuestionModel] = []
    
    func fetchDatax(completion: @escaping () -> Void) {
        WebService.shared.getQuestions { responseModel in
            if let rModel = responseModel, let questions = responseModel?.questions {
                
                self.responseModel = rModel
                self.questionModel = questions
                completion()
            }
        }
    }
    
    
    func numberOfItemsInsection() -> Int {
        return questionModel.count
    }
    
    func questionID(at index: Int) -> QuestionModel? {
        guard index >= 0 && index < questionModel.count else {
            return nil
        }
        
        return questionModel[index]
    }
    
}
