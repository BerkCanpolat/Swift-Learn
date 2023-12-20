//
//  NotsUpdateVC.swift
//  odevApp-7
//
//  Created by Berk Canpolat on 20.12.2023.
//

import UIKit

class NotsUpdateVC: UIViewController {
    
    @IBOutlet weak var headField: UITextField!
    @IBOutlet weak var contentField: UITextField!
    @IBOutlet weak var updateHidden: UIBarButtonItem!
    
    
    //MARK: - Propertys
    var updateNote:NotsModel?
    
    

    //MARK: - LifeCycle
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
        
        if let n = updateNote {
            headField.text = n.nots_head
            contentField.text = n.nots_content
        }
        
    }
    
    
    @IBAction func updateButton(_ sender: Any) {
        if let head = headField.text, let content = contentField.text, let n = updateNote {
            print("\(head) - \(content) - \(n.nots_id)")
        }
    }
    
}
