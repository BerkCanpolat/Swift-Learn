//
//  ViewController.swift
//  CollectionViewKullanimi
//
//  Created by Berk Canpolat on 22.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var ulkeler = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tasrim: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        let genislik = self.collectionView.frame.size.width
        
        tasrim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        tasrim.itemSize = CGSize(width: (genislik-30)/2, height: (genislik-30)/3)
        
        tasrim.minimumInteritemSpacing = 5
        
        tasrim.minimumLineSpacing = 5
        
        collectionView.collectionViewLayout = tasrim
        
        
        ulkeler = ["Türkiye","Almanya","Rusya","Fransa","Hollanda"]
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ulkeler.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionID", for: indexPath) as! CollectionViewCell
        
        cell.collectionLabel.text = ulkeler[indexPath.row]
        
        cell.layer.borderColor = UIColor.green.cgColor
        cell.layer.borderWidth = 1
        
        return cell
    }
    
}

