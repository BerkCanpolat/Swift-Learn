//
//  DetaySayfa.swift
//  UrunlerApp
//
//  Created by Berk Canpolat on 15.12.2023.
//

import UIKit

class DetaySayfa: UIViewController {

    @IBOutlet weak var imageViewUrun: UIImageView!
    @IBOutlet weak var labelUrunFiyat: UILabel!
    
    var urun:Urunler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let u = urun {
            self.navigationItem.title = u.ad
            imageViewUrun.image = UIImage(named: u.resim!)
            labelUrunFiyat.text = "\(u.fiyat!) ₺"
        }

    }
    
    @IBAction func buttonSepeteEkle(_ sender: Any) {
        if let u = urun {
            print("Detay sayfa: \(u.ad!) Sepete Eklendi")
        }
    }
    

}
