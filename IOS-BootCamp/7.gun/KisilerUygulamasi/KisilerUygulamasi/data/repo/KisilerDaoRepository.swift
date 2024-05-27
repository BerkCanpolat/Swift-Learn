//
//  KisilerDaoRepository.swift
//  KisilerUygulamasi
//
//  Created by Berk Canpolat on 16.12.2023.
//

import Foundation
import RxSwift

class KisilerDaoRepository {
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    
    func kaydet(kisi_ad:String,kisi_tel:String) {
        let yeniKisi:[String:Any] = ["kisi_ad":kisi_ad,"kisi_tel":kisi_tel,"kisi_id":""]
    }
    
    func guncelle(kisi_ad:String,kisi_tel:String,kisi_id:Int) {
        print("Kişi Kaydet: \(kisi_id) - \(kisi_ad) - \(kisi_tel)")
    }

    
    func sil(kisi_id:Int) {
        print("Kişi Sil: \(kisi_id)")
        kisileriYukle()
    }
    
    func arama(search:String) {
        print("Kişi ara: \(search)")
    }
    
    func kisileriYukle() {
        var liste = [Kisiler]()
        
        let k1 = Kisiler(kisi_id: 1, kisi_ad: "Berk", kisi_tel: "123213123")
        let k2 = Kisiler(kisi_id: 2, kisi_ad: "Hasan", kisi_tel: "12312313")
        let k3 = Kisiler(kisi_id: 3, kisi_ad: "Ali", kisi_tel: "1111111")
        let k4 = Kisiler(kisi_id: 4, kisi_ad: "Veli", kisi_tel: "444444444")
        
        liste.append(k1)
        liste.append(k2)
        liste.append(k3)
        liste.append(k4)
        
        kisilerListesi.onNext(liste)
    }
    
}
