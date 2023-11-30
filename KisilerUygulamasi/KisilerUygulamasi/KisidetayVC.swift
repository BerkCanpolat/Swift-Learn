//
//  KisidetayVC.swift
//  KisilerUygulamasi
//
//  Created by Berk Canpolat on 23.11.2023.
//

import UIKit

class KisidetayVC: UIViewController {
    
    //MARK: - UIElements
    @IBOutlet weak var kisiadLabel: UILabel!
    @IBOutlet weak var kisitelLabel: UILabel!
    
    
    //MARK: - Propertys
    var kisi:Kisiler?

    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        if let k = kisi {
            kisiadLabel.text = k.kisi_ad
            kisitelLabel.text = k.kisi_tel
        }
        
    }
    

}
