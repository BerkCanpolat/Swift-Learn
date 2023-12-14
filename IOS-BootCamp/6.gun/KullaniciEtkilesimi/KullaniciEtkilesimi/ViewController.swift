//
//  ViewController.swift
//  KullaniciEtkilesimi
//
//  Created by Berk Canpolat on 15.12.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func buttonAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "Başlık", message: "Mesaj", preferredStyle: .alert)
        
        let iptalAction = UIAlertAction(title: "İptal", style: .cancel) { action in
            print("İptal Seçildi")
        }
        
        let tamamAction = UIAlertAction(title: "tamam", style: .destructive) { action in
            print("Tamam Seçildi")
        }

        alertController.addAction(tamamAction)
        alertController.addAction(iptalAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    @IBAction func buttonActionSheet(_ sender: Any) {
        let alertController = UIAlertController(title: "Başlık", message: "Mesaj", preferredStyle: .actionSheet)
        
        let iptalAction = UIAlertAction(title: "İptal", style: .cancel) { action in
            print("İptal Seçildi")
        }
        
        let tamamAction = UIAlertAction(title: "tamam", style: .destructive) { action in
            print("Tamam Seçildi")
        }

        alertController.addAction(tamamAction)
        alertController.addAction(iptalAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func buttonOzelAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "Başlık", message: "Mesaj", preferredStyle: .alert)
        
        alertController.addTextField { text in
            text.placeholder = "Veri Giriniz"
            text.keyboardType = .numberPad
            text.isSecureTextEntry = true
            
        }
        
        let tamamAction = UIAlertAction(title: "tamam", style: .destructive) { action in
            let tf = alertController.textFields![0] as UITextField
            
            if let alinanVeri = tf.text {
                print("Veri: \(alinanVeri)")
            }
            print("Tamam Seçildi")
        }

        
        alertController.addAction(tamamAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    

}

