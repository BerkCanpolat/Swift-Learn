//
//  ViewController.swift
//  NewsApp
//
//  Created by Berk Canpolat on 26.12.2023.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var model: [Model] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getData()
        
    }
    
    func getData() {
        WebServices.shared.fetchNews { model in
            
            if let modelx = model {
                DispatchQueue.main.async {
                    self.model = modelx
                    self.tableView.reloadData()
                }
            } else {
                print("Veri gelmedi")
            }
            
        }
    }


}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsCell
        
        let item = model[indexPath.row]
        
        cell.newsTitle.text = item.title
        cell.newsDescription.text = item.description
        cell.newsIV.sd_setImage(with: URL(string: item.urlToImage!))
        
        return cell
    }
    
}

