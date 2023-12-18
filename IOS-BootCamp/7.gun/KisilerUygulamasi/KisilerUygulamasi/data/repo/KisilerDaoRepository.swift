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
    
    let db: FMDatabase?
    
    init() {
        let hedefYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniUrl = URL(string: hedefYolu)!.appendingPathComponent("rehber.sqlite")
        db = FMDatabase(path: veritabaniUrl.path)
    }
    
    func kaydet(kisi_ad:String,kisi_tel:String) {
        db?.open()
                
        do {
            try db!.executeUpdate("INSERT INTO kisiler (kisi_ad,kisi_tel) VALUES (?,?)", values: [kisi_ad,kisi_tel])
            
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func guncelle(kisi_ad:String,kisi_tel:String,kisi_id:Int) {
        db?.open()
                
        do {
            try db!.executeUpdate("UPDATE kisiler SET kisi_ad = ?,kisi_tel = ? WHERE kisi_id = ?", values: [kisi_ad,kisi_tel,kisi_id])
            
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()

    }

    
    func sil(kisi_id:Int) {
        db?.open()
                
        do {
            try db!.executeUpdate("DELETE FROM kisiler WHERE kisi_id = ?", values: [kisi_id])
            kisileriYukle()
            
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
        
    }
    
    func arama(search:String) {
        db?.open()
        
        var liste = [Kisiler]()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM kisiler WHERE kisi_ad like '%\(search)%'", values: nil)
            
            while rs.next() {
                let kisi = Kisiler(kisi_id: Int(rs.string(forColumn: "kisi_id"))!, kisi_ad: rs.string(forColumn: "kisi_ad")!, kisi_tel: rs.string(forColumn: "kisi_tel")!)
                
                liste.append(kisi)
            }
            
            kisilerListesi.onNext(liste)
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func kisileriYukle() {
        db?.open()
        
        var liste = [Kisiler]()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM kisiler", values: nil)
            
            while rs.next() {
                let kisi = Kisiler(kisi_id: Int(rs.string(forColumn: "kisi_id"))!, kisi_ad: rs.string(forColumn: "kisi_ad")!, kisi_tel: rs.string(forColumn: "kisi_tel")!)
                
                liste.append(kisi)
            }
            
            kisilerListesi.onNext(liste)
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
}
