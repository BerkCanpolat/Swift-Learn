//
//  ViewController.swift
//  ArtbookProject
//
//  Created by Berk Canpolat on 24.11.2023.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var nameArray = [String]()
    var idArray = [UUID]()
    
    var detayGiris = ""
    var detayID: UUID?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem =  UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(self.navigator))
        
        getData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(self.getData), name: NSNotification.Name(rawValue: "newData"), object: nil)
    }
    
    @objc func navigator() {
        detayGiris = ""
        performSegue(withIdentifier: "detayGecis", sender: nil)
    }
    
    
    @objc func getData() {
        
        nameArray.removeAll(keepingCapacity: false)
        idArray.removeAll(keepingCapacity: false)
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(fetchRequest)
            
            if results.count > 0 {
                for i in results as! [NSManagedObject] {
                   if let name = i.value(forKey: "name") as? String {
                       self.nameArray.append(name)
                    }
                    
                    if let id = i.value(forKey: "id") as? UUID {
                        self.idArray.append(id)
                    }
                    
                    self.tableView.reloadData()
                }
            }
            
        } catch {
            print("Verileri getirirken bir hata oluştu")
        }
        
    }

}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = nameArray[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        detayGiris = nameArray[indexPath.row]
        detayID = idArray[indexPath.row]
        
        performSegue(withIdentifier: "detayGecis", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detayGecis" {
            let segueGecis = segue.destination as! DetailsVC
            segueGecis.detailsHome = detayGiris
            segueGecis.detailsID = detayID
        }
    }
}
