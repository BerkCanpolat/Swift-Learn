//
//  FilmlerDoaRepository.swift
//  FilmlerApp
//
//  Created by Berk Canpolat on 17.12.2023.
//

import Foundation
import RxSwift
import FirebaseFirestore

class FilmlerDoaRepository {
    var filmlerListe = BehaviorSubject<[Filmler]>(value: [Filmler]())
    var collectionFilmler = Firestore.firestore().collection("Filmler")
    
    func filmleriYukle() {
        collectionFilmler.getDocuments { snapshot, error in
            var liste = [Filmler]()
            if let document = snapshot?.documents {
                for doc in document {
                    let data = doc.data()
                    let id = doc.documentID
                    let ad = data["ad"] as? String ?? ""
                    let resim = data["resim"] as? String ?? ""
                    let fiyat = data["fiyat"] as? Int ?? 0
                    
                    let film = Filmler(id: id, ad: ad, resim: resim, fiyat: fiyat)
                    liste.append(film)
                }
            }
            self.filmlerListe.onNext(liste)
        }
    }
}
