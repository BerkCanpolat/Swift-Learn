//
//  ViewController.swift
//  AltinciGunOdev
//
//  Created by Berk Canpolat on 15.12.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Anasayfa"
        navigationItem.backButtonTitle = "Back"
        
        let app = UINavigationBarAppearance()
        
        app.backgroundColor = UIColor.black
        app.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.barStyle = .black
        
        navigationController?.navigationBar.standardAppearance = app
        navigationController?.navigationBar.scrollEdgeAppearance = app
        navigationController?.navigationBar.compactAppearance = app
    }
    
    @IBAction func sayfaAgit(_ sender: Any) {
        performSegue(withIdentifier: "sayfaA", sender: nil)
    }
    

    @IBAction func sayfaBgit(_ sender: Any) {
        performSegue(withIdentifier: "sayfaB", sender: nil)
    }
    
}

