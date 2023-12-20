//
//  NotsModel.swift
//  odevApp-7
//
//  Created by Berk Canpolat on 20.12.2023.
//

import Foundation

class NotsModel {
    var nots_content:String?
    var nots_head:String?
    var nots_id:Int
    
    init(nots_content:String,nots_head:String,nots_id:Int) {
        self.nots_content = nots_content
        self.nots_head = nots_head
        self.nots_id = nots_id
    }
}
