//
//  AnasayfaViewModel.swift
//  KisilerUygulamasi
//
//  Created by Berk Canpolat on 16.12.2023.
//

import Foundation
import RxSwift


class AnasayfaViewModel {
    var krepo = KisilerDaoRepository()
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    
    init() {
        kisilerListesi = krepo.kisilerListesi
        kisileriYukle()
    }
    
    func sil(kisi_id:Int) {
        krepo.sil(kisi_id: kisi_id)
    }
    
    func arama(search:String) {
        krepo.arama(search: search)
    }
    
    func kisileriYukle() {
        krepo.kisileriYukle()
    }
}
