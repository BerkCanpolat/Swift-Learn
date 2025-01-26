//
//  CategoryCollectionViewCell.swift
//  Yummie
//
//  Created by Berk Canpolat on 26.01.2025.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: CategoryCollectionViewCell.self)
    
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLbl: UILabel!
    
    func setup(category: DishCategory) {
        categoryImageView.kf.setImage(with: category.image?.asUrl)
        categoryTitleLbl.text = category.name
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
