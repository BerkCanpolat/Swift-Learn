//
//  ViewController.swift
//  Cok Bolumlu Table View Two
//
//  Created by Berk Canpolat on 22.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var baslik = ["Bilgisayar","Telefon","Giyim"]
    var baslikVerileri = [["Monster","Macbook","Lenovo","Huawei"],["IPhone","Huawei","Xiaomi","Samsung"],["Defacto","Koton","Mavi","Gap"]]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }


}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return baslik.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return baslikVerileri[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return baslik[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = baslikVerileri[indexPath.section][indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(baslik[indexPath.section]) Başlığından \(baslikVerileri[indexPath.section][indexPath.row]) Seçildi")
    }
    
}

