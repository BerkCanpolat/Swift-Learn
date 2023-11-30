//
//  YemekModel.swift
//  DetaliTabelView
//
//  Created by Berk Canpolat on 22.11.2023.
//

import Foundation

class Yemekler {
    var yemekID:Int?
    var yemekAdi:String?
    var yemekResim:String?
    var yemekFiyat:Double?
    
    init(yemekID: Int, yemekAdi: String, yemekResim: String, yemekFiyat: Double) {
        self.yemekID = yemekID
        self.yemekAdi = yemekAdi
        self.yemekResim = yemekResim
        self.yemekFiyat = yemekFiyat
    }
}
