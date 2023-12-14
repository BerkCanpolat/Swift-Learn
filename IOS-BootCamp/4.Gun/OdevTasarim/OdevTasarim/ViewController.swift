//
//  ViewController.swift
//  OdevTasarim
//
//  Created by Berk Canpolat on 14.12.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Food"
        
        let app = UINavigationBarAppearance()
        
        app.backgroundColor = UIColor(named: "anaRenk")
        app.titleTextAttributes = [.foregroundColor: UIColor(named: "yazi1")!, .font: UIFont(name: "GrandifloraOne-Regular", size: 24)!]
        
        navigationController?.navigationBar.barStyle = .black
        
        navigationController?.navigationBar.standardAppearance = app
        navigationController?.navigationBar.compactAppearance = app
        navigationController?.navigationBar.scrollEdgeAppearance = app
        
    }


}

