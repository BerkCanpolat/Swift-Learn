//
//  DetailVC.swift
//  ProductNetworkProject
//
//  Created by Berk Canpolat on 24.12.2023.
//

import UIKit

class DetailVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var priceLabel: UILabel!
    
    var model: Model?
    var images = [Images]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = model?.title
        descriptionText.text = model?.description
        if let price  = model?.price {
            priceLabel.text = String(price) + "TL"
        } else {
            priceLabel.text = "0 TL"
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DetailCell
        
        if let imageUrlString = images[indexPath.row].images,
           let imageUrl = URL(string: imageUrlString) {
            cell.imageView.sd_setImage(with: imageUrl)
        }
        
        return cell
    }
    



}
