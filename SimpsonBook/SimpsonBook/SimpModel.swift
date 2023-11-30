//
//  SimpModel.swift
//  SimpsonBook
//
//  Created by Berk Canpolat on 24.11.2023.
//

import UIKit

class Model {
    var ad:String?
    var yas:Int?
    var meslek:String?
    var resim: UIImage
    
    
    init(ad: String, yas: Int, meslek: String, resim: UIImage) {
        self.ad = ad
        self.yas = yas
        self.meslek = meslek
        self.resim = resim
    }
    
}
