//
//  KisilerDaoRepository.swift
//  KisilerUygulamasi
//
//  Created by Berk Canpolat on 16.12.2023.
//

import Foundation
import RxSwift
import Alamofire

class KisilerDaoRepository {
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    
    func kaydet(kisi_ad:String,kisi_tel:String) {
        let params: Parameters = ["kisi_ad":kisi_ad,"kisi_tel":kisi_tel]
        AF.request("http://kasimadalan.pe.hu/kisiler/insert_kisiler.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(CRUDCevap.self, from: data)
                    print("Başarılı: \(cevap.success!)")
                    print("Mesaj: \(cevap.message!)")
                } catch {
                    print(error.localizedDescription)
                }
            }
            
        }
    }
    
    func guncelle(kisi_ad:String,kisi_tel:String,kisi_id:Int) {
        let params:Parameters = ["kisi_ad":kisi_ad,"kisi_tel":kisi_tel,"kisi_id":kisi_id]
        AF.request("http://kasimadalan.pe.hu/kisiler/update_kisiler.php",method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(CRUDCevap.self, from: data)
                    print("Başarılı: \(cevap.success!)")
                    print("Mesaj: \(cevap.message!)")
                } catch {
                    print(error.localizedDescription)
                }
            }
            
        }
    }

    
    func sil(kisi_id:Int) {
        let params: Parameters = ["kisi_id":kisi_id]
        AF.request("http://kasimadalan.pe.hu/kisiler/delete_kisiler.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(CRUDCevap.self, from: data)
                    print("Başarılı: \(cevap.success!)")
                    print("Mesaj: \(cevap.message!)")
                    self.kisileriYukle()
                } catch {
                    print(error.localizedDescription)
                }
            }
            
        }
    }
    
    func arama(search:String) {
        let params: Parameters = ["kisi_ad":search]
        AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(KisilerCevap.self, from: data)
                    if let liste = cevap.kisiler {
                        self.kisilerListesi.onNext(liste)
                    } else {
                        self.kisilerListesi.onNext([Kisiler]())
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func kisileriYukle() {
        AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler.php", method: .get).response { response in
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(KisilerCevap.self, from: data)
                    if let liste = cevap.kisiler {
                        self.kisilerListesi.onNext(liste)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}
