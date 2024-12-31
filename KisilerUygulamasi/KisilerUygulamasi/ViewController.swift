//
//  ViewController.swift
//  KisilerUygulamasi
//
//  Created by Berk Canpolat on 23.11.2023.
//

import UIKit
import CoreData

let app = UIApplication.shared.delegate as! AppDelegate

class ViewController: UIViewController {
        
    
    //MARK: - UIElements
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    //MARK: - Propertys
    var kisilerListem = [Kisiler]()
    let context = app.persistentContainer.viewContext
    
    var aramaYapildimi = false
    var aramaKelimesi:String?
    
    
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        searchBar.delegate = self
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        if aramaYapildimi {
            kisiAra(kisi_ad: aramaKelimesi!)
            
        } else {
            kisileriGetir()
        }
        
        tableView.reloadData()
    }
    
    
    func kisileriGetir() {
        do {
            kisilerListem = try context.fetch(Kisiler.fetchRequest())
        } catch {
            print("Kişileri getirirken bir hata oluştu")
        }
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
        
        if segue.identifier == "kisiDetay" {
            let segueDetay = segue.destination as! KisidetayVC
            
            segueDetay.kisi = kisilerListem[indeks!]
        }
        
        if segue.identifier == "kisiGuncelle" {
            let segueGuncelle = segue.destination as! KisiguncelleVC
            
            segueGuncelle.kisi = kisilerListem[indeks!]
        }
    }
    
    func kisiAra(kisi_ad:String) {
        let fetchRequest:NSFetchRequest<Kisiler> = Kisiler.fetchRequest()
        
        fetchRequest.predicate = NSPredicate(format: "kisi_ad CONTAINS %@", kisi_ad)
        
        do {
            kisilerListem = try context.fetch(fetchRequest)
        } catch {
            print(error)
        }
    }


}


//MARK: - TableView
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kisilerListem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! KisilerTableCell
        
        cell.kisilerLabel.text = "\(kisilerListem[indexPath.row].kisi_ad!) - \(kisilerListem[indexPath.row].kisi_tel!)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "kisiDetay", sender: indexPath.row)
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: UIContextualAction.Style.destructive, title: "Sil") { contexttualAction, ViewController, boolValue in
            
            let kisi = self.kisilerListem[indexPath.row]
            
            self.context.delete(kisi)
            
            app.saveContext()
            
            if self.aramaYapildimi {
                self.kisiAra(kisi_ad: self.aramaKelimesi!)
            } else {
                self.kisileriGetir()
            }
            
            self.tableView.reloadData()
            
        }
        
        let guncelleAction = UIContextualAction(style: UIContextualAction.Style.normal, title: "Güncelle") { contexttualAction, ViewController, boolValue in
            
            self.performSegue(withIdentifier: "kisiGuncelle", sender: indexPath.row)
            
        }
        
        return UISwipeActionsConfiguration(actions: [silAction,guncelleAction])
        
    }
    
    
}


//MARK: - Search Bar
extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        aramaKelimesi = searchText
        
        if aramaKelimesi == "" {
            
            aramaYapildimi = false
            kisileriGetir()
            
        } else {
            aramaYapildimi = true
            kisiAra(kisi_ad: aramaKelimesi!)
        }
        
        tableView.reloadData()
        
    }
    
}

