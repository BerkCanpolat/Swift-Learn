//
//  OyunEkraniVC.swift
//  CalismaYapisi
//
//  Created by Berk Canpolat on 14.12.2023.
//

import UIKit

class OyunEkraniVC: UIViewController {
    
    var kisi:Kisiler?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let k = kisi {
            print("Kişi Ad: \(k.ad!)")
            print("Kişi Yaş: \(k.yas!)")
            print("Kişi Boy: \(k.boy!)")
            print("Kişi Bekar Mı?: \(k.bekar!)")
            
            //navigationItem.title = m
        }

    }
    
    @IBAction func buttonGeri(_ sender: Any) {
        //navigationController?.popViewController(animated: true)
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func buttonBitir(_ sender: Any) {
        performSegue(withIdentifier: "sonucEkraninaGecis", sender: nil)
    }
    

}
