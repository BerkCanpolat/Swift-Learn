//
//  ViewController.swift
//  TableViewCustomCell
//
//  Created by Berk Canpolat on 22.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var kisiler = [Model]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let k1 = Model(ad: "Berk", tel: 05446447788, id: "1")
        let k2 = Model(ad: "Ali", tel: 05332332323, id: "2")
        let k3 = Model(ad: "Zeynep", tel: 05662334323, id: "3")
        
        kisiler.append(k1)
        kisiler.append(k2)
        kisiler.append(k3)
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource, cellProtocol {
    
    func benimProtocol(indexPath: IndexPath) {
        print("\(kisiler[indexPath.row].ad!) Seçildi")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kisiler.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! TableViewCell
        
        cell.cellLabel.text = kisiler[indexPath.row].ad
        
        cell.ulasProtocol = self
        cell.ulasIndex = indexPath
        
        return cell
        
    }
    
}

