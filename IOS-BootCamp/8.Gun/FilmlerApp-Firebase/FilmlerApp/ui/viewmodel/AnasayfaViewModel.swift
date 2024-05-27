//
//  AnasayfaViewModel.swift
//  FilmlerApp
//
//  Created by Berk Canpolat on 17.12.2023.
//

import Foundation
import RxSwift

class AnasayfaViewModel {
    var frepo = FilmlerDoaRepository()
    var filmlerListe = BehaviorSubject<[Filmler]>(value: [Filmler]())
    
    init() {
        filmlerListe = frepo.filmlerListe
        filmleriYukle()
    }
    
    func filmleriYukle() {
        frepo.filmleriYukle()
    }
}
