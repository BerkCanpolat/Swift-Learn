//
//  Kisiler.swift
//  KisilerUygulamasi
//
//  Created by Berk Canpolat on 15.12.2023.
//

import Foundation

class Kisiler {
    var kisi_id:String?
    var kisi_ad:String?
    var kisi_tel:String?
    
    init(kisi_id:String,kisi_ad:String,kisi_tel:String) {
        self.kisi_id = kisi_id
        self.kisi_ad = kisi_ad
        self.kisi_tel = kisi_tel
    }
}
