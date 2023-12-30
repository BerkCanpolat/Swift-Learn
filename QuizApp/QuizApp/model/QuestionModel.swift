//
//  QuestionModel.swift
//  QuizApp
//
//  Created by Berk Canpolat on 30.12.2023.
//

import Foundation

struct DataModel:Codable {
    var data : ResponseModel?
}

struct ResponseModel:Codable {
    var questions : [QuestionModel]?
}

struct QuestionModel:Codable {
    var correct_answer:String?
    var option_1:String?
    var option_2:String?
    var option_3:String?
    var option_4:String?
}
