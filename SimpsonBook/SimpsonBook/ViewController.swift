//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Berk Canpolat on 24.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var simpsonBook = [Model]()
    
    var detayHome: Model?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let b1 = Model(ad: "Bart", yas: 15, meslek: "Öğrenci", resim: UIImage(named: "bart")!)
        let b2 = Model(ad: "Lisa", yas: 16, meslek: "Öğrenci", resim: UIImage(named: "lisa")!)
        let b3 = Model(ad: "Homer", yas: 40, meslek: "Memur", resim: UIImage(named: "homer")!)
        let b4 = Model(ad: "Maggie", yas: 1, meslek: "Bebek", resim: UIImage(named: "maggie")!)
        let b5 = Model(ad: "Marge", yas: 35, meslek: "Ev Hanımı", resim: UIImage(named: "marge")!)
        
        simpsonBook.append(b1)
        simpsonBook.append(b2)
        simpsonBook.append(b3)
        simpsonBook.append(b4)
        simpsonBook.append(b5)
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return simpsonBook.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = simpsonBook[indexPath.row].ad
        cell.contentConfiguration = content
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        detayHome = simpsonBook[indexPath.row]
        
        performSegue(withIdentifier: "detayGecis", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detayGecis" {
            let segueGecis = segue.destination as! DetayPageVC
            segueGecis.simpsonDetay = detayHome
        }
    }
    
}

