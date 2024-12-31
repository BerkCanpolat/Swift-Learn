//
//  ViewController.swift
//  OOPCollectionAndTableView
//
//  Created by Berk Canpolat on 26.05.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var categories: [Categories] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupTable()
        
    }
    
    private func setupData() {
        let category1 = Categories(name: "Birinci Kategori", movies: [Movies(image: "resim"), Movies(image: "resim2")])
        /*let category2 = Categories(name: "İkinci Kategori", movies: [Movies(image: "resim2"), Movies(image: "resim")])
        let category3 = Categories(name: "Üçüncü Kategori", movies: [Movies(image: "resim"), Movies(image: "resim2")])
        let category4 = Categories(name: "Dördüncü Kategori", movies: [Movies(image: "resim2"), Movies(image: "resim")])
        let category5 = Categories(name: "Beşinci Kategori", movies: [Movies(image: "resim"), Movies(image: "resim2")])*/
        
        categories = [category1]
    }
    
    func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self

    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let movie = categories[indexPath.section]
        cell.configure(with: movie.movies)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categories[section].name
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
