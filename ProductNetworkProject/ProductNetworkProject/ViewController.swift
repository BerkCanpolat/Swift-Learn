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
    
    var model: [Model] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        getData()
    }
    
    func getData() {
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
                            print(products)
                            var imagesArray = [Images]()
                            for product in products {
                                self.model.append(Model(
                                    title: "\(product["title"]!)",
                                    description: "\(product["description"]!)",
                                    price: product["price"] as? Int,
                                    thumbnail: "\(product["thumbnail"]!)",
                                    images: imagesArray))
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



extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var m = model[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductCell
        
        cell.productLabel.text = m.title
        cell.imageView.sd_setImage(with: URL(string: m.thumbnail!))
        
        
        return cell
    }
}
