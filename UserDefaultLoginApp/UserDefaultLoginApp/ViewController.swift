//
//  ViewController.swift
//  UserDefaultLoginApp
//
//  Created by Berk Canpolat on 22.11.2023.
//

import UIKit


//MARK: - Global
let d = UserDefaults.standard




class ViewController: UIViewController {
    
    
    //MARK: - UIElements
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ka = d.string(forKey: "kullaniciAdi") ?? "Boş"
        let ks = d.string(forKey: "kullaniciSifre") ?? "Boş"
        
        if ka != "Boş" && ks != "Boş" {
            performSegue(withIdentifier: "sayfaGecis", sender: nil)
        }
        
    }


    
    //MARK: - Actions
    @IBAction func girisButton(_ sender: Any) {
        
        if let ka = nameField.text, let ks = passwordField.text {
            
            if ka == "admin" && ks == "123456" {
                
                d.set(ka, forKey: "kullaniciAdi")
                d.set(ks, forKey: "kullaniciSifre")
                
                performSegue(withIdentifier: "sayfaGecis", sender: nil)
                
            } else {
                print("Geçiş Yaparken Bir Hata Oluştu")
            }
            
        }
        
    }
    
    
}

