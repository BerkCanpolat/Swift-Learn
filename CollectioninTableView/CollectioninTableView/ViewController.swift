//
//  ViewController.swift
//  CollectioninTableView
//
//  Created by Berk Canpolat on 22.05.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var list = [Product]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        for i in 0...9 {
            let model = Product()
            model.name = "Product Header \(i + 1)"
            
            for j in 0...5 {
                let sub_model = Product()
                sub_model.name = "Product Header \(j + 1)"
                model.sub_product.append(sub_model)
            }
            list.append(model)
        }
    }

    
}



extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "header")
        cell?.textLabel?.text = list[section].name
        cell?.textLabel?.textColor = .white
        cell?.textLabel?.font = UIFont(name: "Verdana", size: 25)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
}
