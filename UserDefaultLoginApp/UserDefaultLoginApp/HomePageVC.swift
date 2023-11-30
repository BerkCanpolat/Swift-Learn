//
//  HomePageVC.swift
//  UserDefaultLoginApp
//
//  Created by Berk Canpolat on 22.11.2023.
//

import UIKit

class HomePageVC: UIViewController {
    
    
    @IBOutlet weak var girisLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        let ka = d.string(forKey: "kullaniciAdi") ?? "Boş"
        
        girisLabel.text = ka

        
    }
    
    
    @IBAction func cikisButton(_ sender: Any) {
        d.removeObject(forKey: "kullaniciAdi")
        d.removeObject(forKey: "kullaniciSifre")
        exit(-1)
    }
    
}
