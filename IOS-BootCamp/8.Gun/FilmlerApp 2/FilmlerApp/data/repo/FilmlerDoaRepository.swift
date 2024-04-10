//
//  FilmlerDoaRepository.swift
//  FilmlerApp
//
//  Created by Berk Canpolat on 17.12.2023.
//

import Foundation
import RxSwift
import Alamofire

class FilmlerDoaRepository {
    var filmlerListe = BehaviorSubject<[Filmler]>(value: [Filmler]())
    
    func filmleriYukle() {
        AF.request("http://kasimadalan.pe.hu/filmler_yeni/tum_filmler.php", method: .get).response { response in
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(FilmlerCevap.self, from: data)
                    if let gelenCevap = cevap.filmler {
                        self.filmlerListe.onNext(gelenCevap)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
