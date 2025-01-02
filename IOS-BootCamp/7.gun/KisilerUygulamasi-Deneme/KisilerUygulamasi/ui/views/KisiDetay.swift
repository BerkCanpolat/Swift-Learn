//
//  KisiDetay.swift
//  KisilerUygulamasi
//
//  Created by Berk Canpolat on 15.12.2023.
//

import UIKit

class KisiDetay: UIViewController {
    
    
    @IBOutlet weak var tfKisiAd: UITextField!
    @IBOutlet weak var tfKisiTel: UITextField!
    
    var kisi:Kisiler?
    var viewModel = KisiDetayViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let k = kisi {
            tfKisiAd.text = k.kisi_ad
            tfKisiTel.text = k.kisi_tel
        }
    }

    @IBAction func buttonGuncelle(_ sender: Any) {
        if let ka = tfKisiAd.text, let kt = tfKisiTel.text, let k = kisi {
            viewModel.guncelle(kisi_ad: ka, kisi_tel: kt, kisi_id: k.kisi_id!)
        }
    }
        
}