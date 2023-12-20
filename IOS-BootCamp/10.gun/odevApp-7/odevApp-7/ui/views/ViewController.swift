//
//  ViewController.swift
//  odevApp-7
//
//  Created by Berk Canpolat on 20.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableViews: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    
    
    //MARK: - Propertys
    var notsList = [NotsModel]()
    
    
    
    
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
        
        tableViews.delegate = self
        tableViews.dataSource = self
        
        let n1 = NotsModel(nots_content: "Bugün swift ile sqlite kullanarak not uygulaması geliştiriyorum deneme yapıyorum broo", nots_head: "Swift - Sqlite", nots_date: "12/20/2023",nots_id: 1)
        let n2 = NotsModel(nots_content: "Buda ikinci notum", nots_head: "Başlığım", nots_date: "12/12/2024",nots_id: 2)
        
        notsList.append(n1)
        notsList.append(n2)
    }


}



//MARK: - TableView
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let notIndex = notsList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "notID", for: indexPath) as! NotsCell
        
        cell.notsHeadLabel.text = notIndex.nots_head
        cell.notsContentLabel.text = notIndex.nots_content
        cell.notsDateLabel.text = notIndex.nots_date
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let notIndex = notsList[indexPath.row]
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil") { contextualAction, view,bool in
            let alert = UIAlertController(title: "Notu Sil", message: "\(notIndex.nots_head!) başlıklı notu silmek istediğine emin misin?", preferredStyle: .alert)
            let evetAction = UIAlertAction(title: "Evet", style: .destructive) { UIAlertAction in
                print("\(notIndex.nots_head!) - Silindi")
            }
            
            let hayirAction = UIAlertAction(title: "Hayır", style: .default)
            
            alert.addAction(hayirAction)
            alert.addAction(evetAction)
            
            self.present(alert, animated: true, completion: nil)
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let notIndex = notsList[indexPath.row]
        
        performSegue(withIdentifier: "update", sender: notIndex)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "update" {
            if let notsData = sender as? NotsModel {
                let goVC = segue.destination as! NotsUpdateVC
                goVC.updateNote = notsData
            }
        }
    }
    
    
}



//MARK: - Search Bar
extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("\(searchText)")
    }
}

