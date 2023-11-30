//
//  Model.swift
//  TableViewCustomCell
//
//  Created by Berk Canpolat on 22.11.2023.
//

import Foundation

class Model {
    var ad:String?
    var tel:Int?
    var id:String?
    
    init(ad: String, tel: Int, id: String) {
        self.ad = ad
        self.tel = tel
        self.id = id
    }
}
