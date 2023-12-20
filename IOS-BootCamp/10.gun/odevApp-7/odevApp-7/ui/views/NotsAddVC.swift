//
//  NotsAddVC.swift
//  odevApp-7
//
//  Created by Berk Canpolat on 20.12.2023.
//

import UIKit

class NotsAddVC: UIViewController {
    
    
    @IBOutlet weak var headField: UITextField!
    @IBOutlet weak var contentField: UITextField!
    @IBOutlet weak var notsAddhidden: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let app = UINavigationBarAppearance()
        
        app.backgroundColor = UIColor.brown
        app.titleTextAttributes = [.foregroundColor: UIColor.white]
        app.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barStyle = .black
        
        navigationController?.navigationBar.standardAppearance = app
        navigationController?.navigationBar.compactAppearance = app
        navigationController?.navigationBar.scrollEdgeAppearance = app
    }
    
    
    @IBAction func notsAdd(_ sender: Any) {
        
        if let head = headField.text, let content = contentField.text {
            print("\(head) - \(content) Eklendi")
        }
        
    }
    
    
}
