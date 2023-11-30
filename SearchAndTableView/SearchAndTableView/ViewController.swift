//
//  ViewController.swift
//  SearchAndTableView
//
//  Created by Berk Canpolat on 22.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    //MARK: - UIElements
    @IBOutlet weak var serchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - Propertys
    var ulkeler = [String]()
    var ulkeAramaSonucu = [String]()
    var aramaYapildiMi = false
    
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ulkeler = ["Türkiye","Almanya","Fransa","Hollanda","İsviçre"]
        
        tableView.delegate = self
        tableView.dataSource = self
        
        serchBar.delegate = self
        
    }

}

//MARK: - TableView

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if aramaYapildiMi {
            return ulkeAramaSonucu.count
        } else {
            return ulkeler.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        
        if aramaYapildiMi {
            var content = cell.defaultContentConfiguration()
            content.text = ulkeAramaSonucu[indexPath.row]
            cell.contentConfiguration = content
        } else {
            var content = cell.defaultContentConfiguration()
            content.text = ulkeler[indexPath.row]
            cell.contentConfiguration = content
        }
        
        return cell
    }
    
}



//MARK: - Search Bar
extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText == "" {
            aramaYapildiMi = false
        } else {
            aramaYapildiMi = true
            ulkeAramaSonucu = ulkeler.filter({$0.lowercased().contains(searchText.lowercased())})
        }
        
        tableView.reloadData()
        
        
    }
    
}

