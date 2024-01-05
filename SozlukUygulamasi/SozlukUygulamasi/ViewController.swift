//
//  ViewController.swift
//  SozlukUygulamasi
//
//  Created by Berk Canpolat on 5.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var kelimeListesi = [Kelimeler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let k1 = Kelimeler(kelime_id: 1, ingilizce: "Table", turkce: "Masa")
        let k2 = Kelimeler(kelime_id: 2, ingilizce: "Door", turkce: "Kapı")
        let k3 = Kelimeler(kelime_id: 3, ingilizce: "Windows", turkce: "Pencere")
        
        kelimeListesi.append(k1)
        kelimeListesi.append(k2)
        kelimeListesi.append(k3)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        searchBar.delegate = self
        
    }

}



extension ViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kelimeListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "kelimeHucre", for: indexPath) as! KelimeTableViewCell
        
        cell.ingilizceLabel.text = kelimeListesi[indexPath.row].ingilizce
        cell.turkceLabel.text = kelimeListesi[indexPath.row].turkce
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "toDetay", sender: nil)
        
    }
}


extension ViewController:UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
    
}
