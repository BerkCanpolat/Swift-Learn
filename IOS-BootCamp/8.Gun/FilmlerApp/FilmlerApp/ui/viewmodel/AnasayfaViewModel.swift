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
        veritabaniKopyala()
        filmlerListe = frepo.filmlerListe
        filmleriYukle()
    }
    
    func filmleriYukle() {
        frepo.filmleriYukle()
    }
    
    
    func veritabaniKopyala() {
        let bundleYolu = Bundle.main.path(forResource: "filmler_app", ofType: ".sqlite")
        let hedefYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(string: hedefYolu)!.appendingPathComponent("filmler_app.sqlite")
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: kopyalanacakYer.path) {
            print("Veri tabanı zaten var")
        } else {
            do {
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            } catch {
                
            }
        }
    }
}
