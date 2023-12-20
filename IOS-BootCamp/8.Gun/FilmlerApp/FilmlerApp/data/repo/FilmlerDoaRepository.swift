//
//  FilmlerDoaRepository.swift
//  FilmlerApp
//
//  Created by Berk Canpolat on 17.12.2023.
//

import Foundation
import RxSwift

class FilmlerDoaRepository {
    var filmlerListe = BehaviorSubject<[Filmler]>(value: [Filmler]())
    
    let db: FMDatabase?
    
    init() {
        let hedefYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniUrl = URL(string: hedefYolu)!.appendingPathComponent("filmler_app.sqlite")
        db = FMDatabase(path: veritabaniUrl.path)
    }
    
    func filmleriYukle() {
        

        
        
        db?.open()
        
        var liste = [Filmler]()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM filmler", values: nil)
            
            while rs.next() {
                let film = Filmler(id: Int(rs.string(forColumn: "id"))!,
                                   ad: rs.string(forColumn: "ad")!,
                                   resim: rs.string(forColumn: "resim")!,
                                   fiyat: Int(rs.string(forColumn: "fiyat"))!)
                
                liste.append(film)
            }
            filmlerListe.onNext(liste)
            
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
