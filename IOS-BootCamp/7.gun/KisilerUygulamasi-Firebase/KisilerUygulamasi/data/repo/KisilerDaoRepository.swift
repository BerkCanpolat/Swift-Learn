//
//  KisilerDaoRepository.swift
//  KisilerUygulamasi
//
//  Created by Berk Canpolat on 16.12.2023.
//

import Foundation
import RxSwift
import FirebaseFirestore

class KisilerDaoRepository {
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    var collectionKisiler = Firestore.firestore().collection("Kisiler")
    
    func kaydet(kisi_ad:String,kisi_tel:String) {
        let yeniKisi:[String:Any] = ["kisi_id":"","kisi_ad":kisi_ad,"kisi_tel":kisi_tel]
        collectionKisiler.document().setData(yeniKisi)
    }
    
    func guncelle(kisi_ad:String,kisi_tel:String,kisi_id:String) {
        let guncellenenKisi:[String:Any] = ["kisi_ad":kisi_ad,"kisi_tel":kisi_tel]
        collectionKisiler.document(kisi_id).updateData(guncellenenKisi)
    }

    
    func sil(kisi_id:String) {
        collectionKisiler.document(kisi_id).delete()
    }
    
    func arama(search:String) {
        collectionKisiler.addSnapshotListener { snapshot, error in
            var liste = [Kisiler]()
            
            if let document = snapshot?.documents {
                for doc in document {
                    let data = doc.data()
                    let kisi_id = doc.documentID
                    let kisi_ad = data["kisi_ad"] as? String ?? ""
                    let kisi_tel = data["kisi_tel"] as? String ?? ""
                    
                    if kisi_ad.lowercased().contains(search.lowercased()) {
                        let kisi = Kisiler(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
                        liste.append(kisi)

                    }
                }
            }
            self.kisilerListesi.onNext(liste)
        }
    }
    
    func kisileriYukle() {
        collectionKisiler.addSnapshotListener { snapshot, error in
            var liste = [Kisiler]()
            
            if let document = snapshot?.documents {
                for doc in document {
                    let data = doc.data()
                    let kisi_id = doc.documentID
                    let kisi_ad = data["kisi_ad"] as? String ?? ""
                    let kisi_tel = data["kisi_tel"] as? String ?? ""
                    
                    let kisi = Kisiler(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
                    liste.append(kisi)
                }
            }
            self.kisilerListesi.onNext(liste)
        }
    }
    
}
