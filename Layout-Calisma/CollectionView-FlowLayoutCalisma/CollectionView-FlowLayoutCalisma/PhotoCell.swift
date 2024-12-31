//
//  PhotoCell.swift
//  CollectionView-FlowLayoutCalisma
//
//  Created by Berk Canpolat on 31.12.2024.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    static let reuseldentifier:String = "cell"
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addCornerRadius()
    }
    
    private func addCornerRadius() {
        self.layer.cornerRadius = 10
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.masksToBounds = false
        
        self.imageView.layer.cornerRadius = 10
    }
    
    func displayPhotos(_ photoName:String) {
        self.imageView.image = UIImage(named: photoName)
    }
    
}
