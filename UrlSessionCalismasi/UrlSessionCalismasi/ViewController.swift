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
        kisiEkle()
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

}

