//
//  UrunlerDaoRepository.swift
//  getirappOdev
//
//  Created by Berk Canpolat on 18.12.2023.
//

import Foundation
import RxSwift

class UrunlerDaoRepository {
    var urunlerim = BehaviorSubject<[Urunler]>(value: [Urunler]())
    var listemUrun = [Urunler]()
    
    func urunleriGetir() {
        var listem = listemUrun
        
        let u1 = Urunler(urun_ad: "Yiyecek", urun_resim: "yiyecek")
        let u2 = Urunler(urun_ad: "İçecek", urun_resim: "icecek")
        let u3 = Urunler(urun_ad: "Kişisel Bakım", urun_resim: "kisiselbakim")
        let u4 = Urunler(urun_ad: "Bebek", urun_resim: "bebekbakim")
        let u5 = Urunler(urun_ad: "Teknoloji", urun_resim: "kulaklik")
        let u6 = Urunler(urun_ad: "Sağlık", urun_resim: "saglik")
        let u7 = Urunler(urun_ad: "Ev Bakım", urun_resim: "evbakim")
        let u8 = Urunler(urun_ad: "Evcil Hayvan", urun_resim: "evcilhayvan")
        let u9 = Urunler(urun_ad: "Cinsel Sağlık", urun_resim: "cinselsaglik")
        let u10 = Urunler(urun_ad: "Oyun", urun_resim: "oyun")
        let u11 = Urunler(urun_ad: "Aksesuar", urun_resim: "aksesuar")
        let u12 = Urunler(urun_ad: "Ivır Zıvır", urun_resim: "ivirzivir")
        
        listem.append(u1)
        listem.append(u2)
        listem.append(u3)
        listem.append(u4)
        listem.append(u5)
        listem.append(u6)
        listem.append(u7)
        listem.append(u8)
        listem.append(u9)
        listem.append(u10)
        listem.append(u11)
        listem.append(u12)
        urunlerim.onNext(listem)

    }
    
}
