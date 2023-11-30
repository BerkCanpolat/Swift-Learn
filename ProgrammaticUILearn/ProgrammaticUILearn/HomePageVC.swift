//
//  HomePageVC.swift
//  ProgrammaticUILearn
//
//  Created by Berk Canpolat on 20.11.2023.
//

import UIKit

class HomePageVC: UIViewController {
    
    //MARK: - UIElements
    lazy var tableView = UITableView()
    var myModel = [Mock(takim: "Beşiktaş"),Mock(takim: "Fenerbahçe"),Mock(takim: "Galatasaray"),Mock(takim: "Trabzonspor")]

    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .brown
        tableConfig()
    }
    
    //MARK: - Helpers
    func tableConfig() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reusID)
        
    }

}

//MARK: - TableView

extension HomePageVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "UYARI", message: "Seçilen takım \(myModel[indexPath.row].takim)", preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default)
        let cancelButton = UIAlertAction(title: "İptal", style: UIAlertAction.Style.destructive)
        alert.addAction(okButton)
        alert.addAction(cancelButton)
        present(alert, animated: true, completion: nil)
    }
    
}

extension HomePageVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reusID, for: indexPath) as! TableViewCell
        
        var content = cell.defaultContentConfiguration()
        content.text = myModel[indexPath.row].takim
        cell.contentConfiguration = content
        
        return cell
        
    }
    
}
