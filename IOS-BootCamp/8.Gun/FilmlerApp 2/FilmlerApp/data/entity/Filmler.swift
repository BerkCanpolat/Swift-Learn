//
//  Filmler.swift
//  FilmlerApp
//
//  Created by Berk Canpolat on 16.12.2023.
//

import Foundation

class Filmler:Codable {
    var id:Int?
    var ad:String?
    var resim:String?
    var fiyat:Int?
    
    init(id: Int, ad: String, resim: String, fiyat: Int) {
        self.id = id
        self.ad = ad
        self.resim = resim
        self.fiyat = fiyat
    }
}

class FilmlerCevap:Codable {
    var filmler:[Filmler]?
    var success:Int?
}
