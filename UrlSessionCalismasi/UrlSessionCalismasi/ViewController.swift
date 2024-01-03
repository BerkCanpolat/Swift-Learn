//
//  ViewController.swift
//  UrlSessionCalismasi
//
//  Created by Berk Canpolat on 3.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //kisiEkle()
        //kisiSil()
        //kisiGuncelle()
        tumKisiler()
        //aramaYap()
    }

    func kisiEkle() {
        var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/insert_kisiler.php")!)
        
        request.httpMethod = "POST"
        let postString = "kisi_ad=berkoo&kisi_tel=cnapotoo"
        request.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil || data == nil {
                print("error")
                return
            } else {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any] {
                        print(json)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
    
    func kisiSil() {
        
        var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/delete_kisiler.php")!)
        request.httpMethod = "POST"
        let postString = "kisi_id=16568"
        request.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil || data == nil {
                print("delete error")
                return
            } else {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any] {
                        print(json)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
        
    }
    
    func kisiGuncelle() {
        
        var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/update_kisiler.php")!)
        request.httpMethod = "POST"
        let postString = "kisi_id=16567&kisi_ad=Deistirdimbro&kisi_tel=telideistirdim"
        request.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil || data == nil {
                print("delete error")
                return
            } else {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any] {
                        print(json)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
        
    }
    
    func tumKisiler() {
        let url = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/tum_kisiler.php")!)
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil || data == nil {
                print("kisiler gelmedi")
                return
            } else {
                do {
                    let json = try JSONDecoder().decode(KisiCevap.self, from: data!)
                    
                    print(json.kisiler![1].kisi_ad!)
                        
                        
                        /*if let result = json["kisiler"] as? [[String:Any]] {
                            for i in result {
                                print("kisi id: \(i["kisi_id"]!)")
                                print("kisi ad: \(i["kisi_ad"]!)")
                                print("kisi tel: \(i["kisi_tel"]!)")
                            }
                        }*/
                        
                        //print(json)
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
    
    func aramaYap() {
        var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php")!)
        request.httpMethod = "POST"
        let postString = "kisi_ad=m"
        request.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil || data == nil {
                print("kisiler gelmedi")
                return
            } else {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any] {
                        print(json)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }

}

