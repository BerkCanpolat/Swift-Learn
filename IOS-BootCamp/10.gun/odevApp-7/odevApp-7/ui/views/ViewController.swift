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
    var viewModel = ViewControllerViewModel()
    let cellSpacingHeight: CGFloat = 5
    
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
        
        _ = viewModel.notsShowList.subscribe(onNext: { list in
            self.notsList = list
            self.tableViews.reloadData()
        })
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.notsShow()
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
        cell.backgroundColor = UIColor.lightText
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.softRandom().cgColor
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let notIndex = notsList[indexPath.row]
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil") { contextualAction, view,bool in
            let alert = UIAlertController(title: "Notu Sil", message: "\(notIndex.nots_head!) başlıklı notu silmek istediğine emin misin?", preferredStyle: .alert)
            let evetAction = UIAlertAction(title: "Evet", style: .destructive) { UIAlertAction in
                self.viewModel.deleteNots(nots_id: notIndex.nots_id)
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
        viewModel.searchNots(search: searchText)
    }
}

extension UIColor {
    static func softRandom() -> UIColor {
        let hue = CGFloat.random(in: 0...1)
        let saturation = CGFloat.random(in: 0.3...0.7)
        let brightness = CGFloat.random(in: 0.7...1.0)
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
    }
}
