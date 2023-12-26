//
//  Model.swift
//  NewsApp
//
//  Created by Berk Canpolat on 26.12.2023.
//

import Foundation

struct Model : Decodable {
    
    var title:String?
    var description:String?
    var urlToImage:String?
    
}

struct NewsResponse:Decodable {
    var articles : [Model]
}
