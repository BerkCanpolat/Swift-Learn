//
//  KelimeDetayVC.swift
//  SozlukUygulamasi
//
//  Created by Berk Canpolat on 5.01.2024.
//

import UIKit

class KelimeDetayVC: UIViewController {
    
    @IBOutlet weak var ingilizceLabel: UILabel!
    @IBOutlet weak var turkceLabel: UILabel!
    
    var kelimeler:Kelimeler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let k = kelimeler {
            self.ingilizceLabel.text = k.ingilizce
            self.turkceLabel.text = k.turkce
        }
        
    }

}
