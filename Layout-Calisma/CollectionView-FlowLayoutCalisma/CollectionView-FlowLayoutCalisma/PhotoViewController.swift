//
//  ViewController.swift
//  CollectionView-FlowLayoutCalisma
//
//  Created by Berk Canpolat on 31.12.2024.
//

import UIKit

class PhotoViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension PhotoViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        photoData.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoData[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.reuseldentifier, for: indexPath) as! PhotoCell
        
        let photoName = photoData[indexPath.section][indexPath.row].photoName
        
        cell.displayPhotos(photoName)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "sectionHeader", for: indexPath) as! PhotoReusableView
        
        let title = (indexPath.section) == 0 ? "Movie Image" : "Image Movie"
        
        
        view.displayHeaderSectionTitle(title)
        
        return view
    }
}


extension PhotoViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let rowCount: CGFloat = 2
        
        let collectionViewWidth = collectionView.bounds.size.width
        
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        
        let spaceBetweenCells = flowLayout.minimumInteritemSpacing * (rowCount - 1)
        
        let padding = flowLayout.sectionInset.left + flowLayout.sectionInset.right
        
        let adjustSize = collectionViewWidth - spaceBetweenCells - padding
        
        let width:CGFloat = floor(adjustSize / rowCount)
        
        let height:CGFloat = 120
        
        return CGSize(width: width, height: height)
        
        
    }
}

