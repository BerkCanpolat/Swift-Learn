//
//  KisiguncelleVC.swift
//  KisilerUygulamasi
//
//  Created by Berk Canpolat on 23.11.2023.
//

import UIKit

class KisiguncelleVC: UIViewController {
    
    
    //MARK: - UIElements
    @IBOutlet weak var kisiadField: UITextField!
    @IBOutlet weak var kisitelField: UITextField!
    
    
    //MARK: - Propertys
    var kisi:Kisiler?
    var context = app.persistentContainer.viewContext
    
    

    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let k = kisi {
            kisiadField.text = k.kisi_ad
            kisitelField.text = k.kisi_tel
        }

        
    }
    
    @IBAction func guncelleButton(_ sender: Any) {
        if let k = kisi, let ka = kisiadField.text, let kt = kisitelField.text {
            
            k.kisi_ad = ka
            k.kisi_tel = kt
            
            app.saveContext()
            
        }
    }
    
}
