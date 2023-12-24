//
//  ViewController.swift
//  FakeApiLearn
//
//  Created by Berk Canpolat on 24.12.2023.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var model: [Model] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        verileriGetir()
    }
    
    func verileriGetir() {
        var url = "https://fakestoreapi.com/products"
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                print("error?.localizedDescription")
                return
            } else {
                do {
                    if let json = try! JSONSerialization.jsonObject(with: data! ,options: []) as? [[String:Any]] {
                        
                        for eleman in json {
                            self.model.append(Model(title: "\(eleman["title"]!)", image: "\(eleman["image"]!)"))
                        }
                        
                        DispatchQueue.main.async {
                            self.collectionView.reloadData()
                        }
                        
                    }
                } catch {
                    
                }
            }
        }.resume()
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductCell
        
        let item = model[indexPath.row]
        
        cell.productLabel.text = item.title
        cell.imageView.sd_setImage(with: URL(string: item.image!))
        
        return cell
    }


}

