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
        
        tableView.delegate = self
        tableView.dataSource = self
        
        searchBar.delegate = self
        
        kelimeleriGetir()
        
    }
    
    func kelimeleriGetir() {
        let url = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/sozluk/tum_kelimeler.php")!)
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil || data == nil {
                print("error hata")
                return
            } else {
                do {
                    let json = try JSONDecoder().decode(KelimelerGir?.self, from: data!)
                    if let result = json?.kelimeler {
                        self.kelimeListesi = result
                    }
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
    
    func aramaYap(ara:String) {
        
        var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/sozluk/kelime_ara.php")!)
        
        request.httpMethod = "POST"
        
        let postString = "ingilizce=\(ara)"
        
        request.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil || data == nil {
                print("error hata")
                return
            } else {
                do {
                    let json = try JSONDecoder().decode(KelimelerGir?.self, from: data!)
                    if let result = json?.kelimeler {
                        self.kelimeListesi = result
                    }
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
        
        let gidilecekVC = segue.destination as! KelimeDetayVC
        
        gidilecekVC.kelimeler = kelimeListesi[indeks!]
    }

}



extension ViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kelimeListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var item = kelimeListesi[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "kelimeHucre", for: indexPath) as! KelimeTableViewCell
        
        cell.ingilizceLabel.text = item.ingilizce
        cell.turkceLabel.text = item.turkce
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var item = kelimeListesi[indexPath.row]
        
        performSegue(withIdentifier: "toDetay", sender: indexPath.row)
        
    }
}


extension ViewController:UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        aramaYap(ara: searchText)
        
    }
    
}
