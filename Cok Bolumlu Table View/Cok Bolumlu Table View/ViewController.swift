//
//  ViewController.swift
//  Cok Bolumlu Table View
//
//  Created by Berk Canpolat on 21.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var oneTableView: UITableView!
    @IBOutlet weak var twoTableView: UITableView!
    
    let sehirler = ["Ankara","İstanbul","İzmir","Bursa"]
    let ulkeler = ["Türkiye","Fransa","ABD","Rusya"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        oneTableView.delegate = self
        oneTableView.dataSource = self
        
        twoTableView.delegate = self
        twoTableView.dataSource = self
        
    }


}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var indeks: Int?
        
        if tableView == oneTableView {
            indeks = sehirler.count
        }
        
        if tableView == twoTableView {
            indeks = ulkeler.count
        }
        
        return indeks!
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        if tableView == oneTableView {
            var content = cell.defaultContentConfiguration()
            content.text = sehirler[indexPath.row]
            cell.contentConfiguration = content
        }
        
        if tableView == twoTableView {
            var content = cell.defaultContentConfiguration()
            content.text = ulkeler[indexPath.row]
            cell.contentConfiguration = content
        }
        
        
        return cell
        
        
    }
    
}

