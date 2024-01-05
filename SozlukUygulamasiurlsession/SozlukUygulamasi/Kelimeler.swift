//
//  Kelimeler.swift
//  SozlukUygulamasi
//
//  Created by Berk Canpolat on 5.01.2024.
//

import Foundation

class Kelimeler:Codable {
    var kelime_id:String?
    var ingilizce:String?
    var turkce:String?
    
    init(kelime_id: String, ingilizce: String, turkce: String) {
        self.kelime_id = kelime_id
        self.ingilizce = ingilizce
        self.turkce = turkce
    }
}

class KelimelerGir:Codable {
    var kelimeler:[Kelimeler]?
}
