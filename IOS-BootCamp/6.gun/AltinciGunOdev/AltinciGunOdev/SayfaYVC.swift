//
//  SayfaYVC.swift
//  AltinciGunOdev
//
//  Created by Berk Canpolat on 15.12.2023.
//

import UIKit

class SayfaYVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Sayfa Y"
        
        let app = UINavigationBarAppearance()
        
        app.backgroundColor = UIColor.green
        app.titleTextAttributes = [.foregroundColor:UIColor.lightGray]
        
        navigationController?.navigationBar.standardAppearance = app
        navigationController?.navigationBar.scrollEdgeAppearance = app
        navigationController?.navigationBar.compactAppearance = app
    }
    
    
    @IBAction func geriDon(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
