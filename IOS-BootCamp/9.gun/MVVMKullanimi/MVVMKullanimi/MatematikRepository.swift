//
//  MatematikRepository.swift
//  MVVMKullanimi
//
//  Created by Berk Canpolat on 16.12.2023.
//

import Foundation
import RxSwift


class MatematikRepository {
    var sonuc = BehaviorSubject<String>(value: "0")
    
    func toplamaYap(alinanSayi1:String,alinanSayi2:String) {
        if let sayi1 = Int(alinanSayi1), let sayi2 = Int(alinanSayi2) {
            let toplam = sayi1 + sayi2
            sonuc.onNext(String(toplam))//Tetikleme
        }
    }
    
    func carmpaYap(alinanSayi1:String,alinanSayi2:String) {
        if let sayi1 = Int(alinanSayi1), let sayi2 = Int(alinanSayi2) {
            let carpma = sayi1 * sayi2
            sonuc.onNext(String(carpma))//Tetikleme
        }
    }

}
