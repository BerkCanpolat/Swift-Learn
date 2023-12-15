//
//  SayfaAVC.swift
//  AltinciGunOdev
//
//  Created by Berk Canpolat on 15.12.2023.
//

import UIKit

class SayfaAVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Sayfa A"
        
        let app = UINavigationBarAppearance()
        
        app.backgroundColor = UIColor.black
        app.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.barStyle = .black
        
        navigationController?.navigationBar.standardAppearance = app
        navigationController?.navigationBar.scrollEdgeAppearance = app
        navigationController?.navigationBar.compactAppearance = app
    }
    
    
    @IBAction func sayfaDgit(_ sender: Any) {
        performSegue(withIdentifier: "sayfaD", sender: nil)
    }
    
}
