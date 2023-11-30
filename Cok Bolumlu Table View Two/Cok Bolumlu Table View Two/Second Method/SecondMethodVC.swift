//
//  SecondMethodVC.swift
//  Cok Bolumlu Table View Two
//
//  Created by Berk Canpolat on 22.11.2023.
//

import UIKit

class SecondMethodVC: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var listem: [Model] = []
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var b1 = Model(baslik: "Bilgisayar", baslikVerileri: ["Monster","Macbook","Huawei"])
        var b2 = Model(baslik: "Telefon", baslikVerileri: ["IPhone","Huawei","Samsung"])
        var b3 = Model(baslik: "Giyim", baslikVerileri: ["Defacto","Koton","Mavi"])
        
        listem = [b1,b2,b3]
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

}


extension SecondMethodVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return listem.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listem[section].baslikVerileri.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return listem[section].baslik
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = listem[indexPath.section].baslikVerileri[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(listem[indexPath.section].baslik) Başlığındanx \(listem[indexPath.section].baslikVerileri[indexPath.row]) Seçildi")
    }
    
}
