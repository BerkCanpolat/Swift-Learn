//
//  ViewController.swift
//  ProductNetworkProject
//
//  Created by Berk Canpolat on 24.12.2023.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let searchController = UISearchController()
    
    var model: [Model] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
        getData(arananKelime: "")
    }
    
    func getData(arananKelime: String) {
        var url = "https://dummyjson.com/products"
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil || data == nil {
                print(error?.localizedDescription)
                return
            } else {
                do {
                    if let json = try! JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any] {
                        
                        if let products = json["products"] as? [[String:Any]] {
                            var imagesArray = [Images]()
                            self.model.removeAll()
                            for product in products {
                                
                                //! işareti varsa arananKelime boş değilse demek. ! yoksa aranan kelime boşsa demek.
                                if !arananKelime.isEmpty {
                                    
                                    if (product["title"] as? String)?.lowercased().range(of: arananKelime.lowercased()) != nil {
                                        self.model.append(Model(
                                            title: "\(product["title"]!)",
                                            thumbnail: "\(product["thumbnail"]!)"))
                                    }
                                    
                                } else {
                                    self.model.append(Model(
                                        title: "\(product["title"]!)",
                                        description: "\(product["description"]!)",
                                        price: product["price"] as? Int,
                                        thumbnail: "\(product["thumbnail"]!)",
                                        images: imagesArray))
                                }

                            }
                            
                            DispatchQueue.main.async {
                                self.collectionView.reloadData()
                            }
                        }
                    }
                } catch {
                    
                }
            }
        }.resume()
        
    }


}



extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        
        getData(arananKelime: text)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var m = model[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductCell
        
        if indexPath.row < model.count {
            cell.productLabel.text = m.title
            cell.imageView.sd_setImage(with: URL(string: m.thumbnail!))
        } else {
            cell.productLabel.text = m.title
            cell.imageView.sd_setImage(with: URL(string: m.thumbnail!))
        }
        
        return cell
    }
}
