//
//  KisiDetayViewModel.swift
//  KisilerUygulamasi
//
//  Created by Berk Canpolat on 16.12.2023.
//

import Foundation

class KisiDetayViewModel {
    var krepo = KisilerDaoRepository()
    
    func guncelle(kisi_ad:String,kisi_tel:String,kisi_id:Int) {
        krepo.guncelle(kisi_ad: kisi_ad, kisi_tel: kisi_tel, kisi_id: kisi_id)
    }

    
}
