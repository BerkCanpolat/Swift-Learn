//
//  KisiekleVC.swift
//  KisilerUygulamasi
//
//  Created by Berk Canpolat on 23.11.2023.
//

import UIKit

class KisiekleVC: UIViewController {
    
    
    //MARK: - UIElements
    @IBOutlet weak var kisiadField: UITextField!
    @IBOutlet weak var kisitelField: UITextField!
    
    
    //MARK: - Propertys
    let context = app.persistentContainer.viewContext
    

    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func ekleButton(_ sender: Any) {
        if let ka = kisiadField.text, let kt = kisitelField.text {
            let kisi = Kisiler(context: context)
            
            kisi.kisi_ad = ka
            kisi.kisi_tel = kt
            
            app.saveContext()
            
        }
    }
    
}
