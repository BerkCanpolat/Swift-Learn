//
//  AnasayfaViewModel.swift
//  getirappOdev
//
//  Created by Berk Canpolat on 18.12.2023.
//

import Foundation
import RxSwift


class AnasayfaViewModel {
    var urepo = UrunlerDaoRepository()
    var urunlerim = BehaviorSubject<[Urunler]>(value: [Urunler]())
    
    init() {
        urunlerim = urepo.urunlerim
        urunleriGetir()
    }
    
    func urunleriGetir() {
        urepo.urunleriGetir()
    }
    
}
