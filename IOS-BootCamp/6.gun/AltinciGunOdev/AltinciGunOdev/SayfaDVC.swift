//
//  SayfaDVC.swift
//  AltinciGunOdev
//
//  Created by Berk Canpolat on 15.12.2023.
//

import UIKit

class SayfaDVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Sayfa D"
        
        let app = UINavigationBarAppearance()
        
        app.backgroundColor = UIColor.black
        app.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.barStyle = .black
        
        navigationController?.navigationBar.standardAppearance = app
        navigationController?.navigationBar.scrollEdgeAppearance = app
        navigationController?.navigationBar.compactAppearance = app
    }
    
    
    @IBAction func sayfaYgit(_ sender: Any) {
        performSegue(withIdentifier: "sayfaY", sender: nil)
    }
    



}
