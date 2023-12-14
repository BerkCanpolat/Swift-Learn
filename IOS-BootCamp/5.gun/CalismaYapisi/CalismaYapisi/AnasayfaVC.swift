//
//  ViewController.swift
//  CalismaYapisi
//
//  Created by Berk Canpolat on 14.12.2023.
//

import UIKit

class AnasayfaVC: UIViewController {
    
    
    @IBOutlet weak var labelAnasayfa: UILabel!
    //Leading - Left
    //Trailing - Right
    

    override func viewDidLoad() {//Uygulama ilk açıldıgında 1 kez çalışır.
        super.viewDidLoad()
        print("viewDidload Çalıştı")
    }
    
    override func viewWillAppear(_ animated: Bool) {//Sayfa her göründüğünde çalışır.
        print("viewWillAppear Çalıştı")
    }
    
    override func viewWillDisappear(_ animated: Bool) {//Sayfa her görünmez olduğunda çalışır.
        print("viewWillDisappear Çalıştı")
    }
    
    @IBAction func buttonYap(_ sender: Any) {
        labelAnasayfa.text = "Değiştirildi"
    }
    
    
    @IBAction func buttonBasla(_ sender: Any) {
        let kisi = Kisiler(ad: "Berk", yas: 24, boy: 178, bekar: true)
        performSegue(withIdentifier: "oyunEkraninaGecis", sender: kisi)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "oyunEkraninaGecis" {
            print("Oyun ekranına geçildi")
            
            if let veri = sender as? Kisiler {
                print("Veri: \(veri)")
                
                let gidilecekSayfa = segue.destination as! OyunEkraniVC
                gidilecekSayfa.kisi = veri
            }
            
        }
    }
    
    
    @IBAction func buttonAdd(_ sender: Any) {
        print("Add Seçildi")
    }
    
    @IBAction func buttonSave(_ sender: Any) {
        print("Save Seçildi")
    }
    

}

