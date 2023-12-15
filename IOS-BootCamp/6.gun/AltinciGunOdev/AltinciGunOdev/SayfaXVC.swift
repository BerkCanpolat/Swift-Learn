//
//  SayfaXVC.swift
//  AltinciGunOdev
//
//  Created by Berk Canpolat on 15.12.2023.
//

import UIKit

class SayfaXVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Sayfa X"
        
        let app = UINavigationBarAppearance()
        
        app.backgroundColor = UIColor.white
        app.titleTextAttributes = [.foregroundColor:UIColor.black]
        
    }
    
    
    @IBAction func gitY(_ sender: Any) {
        performSegue(withIdentifier: "sayfaY", sender: nil)
    }
    
}
