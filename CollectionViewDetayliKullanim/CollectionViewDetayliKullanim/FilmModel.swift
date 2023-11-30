//
//  FilmModel.swift
//  CollectionViewDetayliKullanim
//
//  Created by Berk Canpolat on 22.11.2023.
//

import Foundation

//MARK: - Model
class Filmler {
    var filmAdi:String?
    var filmYil:Int?
    var filmFiyati:Double?
    var filmResim:String?
    
    
    init(filmAdi: String, filmYil: Int, filmFiyati: Double, filmResim: String) {
        self.filmAdi = filmAdi
        self.filmYil = filmYil
        self.filmFiyati = filmFiyati
        self.filmResim = filmResim
    }
}
