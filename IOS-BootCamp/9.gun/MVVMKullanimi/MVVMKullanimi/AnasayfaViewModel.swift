//
//  AnasayfaViewModel.swift
//  MVVMKullanimi
//
//  Created by Berk Canpolat on 16.12.2023.
//

import Foundation
import RxSwift


class AnasayfaViewModel {
    var sonuc = BehaviorSubject<String>(value: "0")
    var mRepo = MatematikRepository()
    
    init() {
        sonuc = mRepo.sonuc
    }
    
    func toplamaYap(alinanSayi1:String,alinanSayi2:String) {
        mRepo.toplamaYap(alinanSayi1: alinanSayi1, alinanSayi2: alinanSayi2)
    }
    
    func carmpaYap(alinanSayi1:String,alinanSayi2:String) {
        mRepo.carmpaYap(alinanSayi1: alinanSayi1, alinanSayi2: alinanSayi2)
    }
    
}
