//
//  DishPortraitCollectionViewCell.swift
//  Yummie
//
//  Created by Berk Canpolat on 26.01.2025.
//

import UIKit

class DishPortraitCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DishPortraitCollectionViewCell"
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    func setup(dish:Dish) {
        titleLbl.text = dish.name
        dishImageView.kf.setImage(
            with: dish.image?.asUrl
        )
        caloriesLbl.text = dish.formattedCalories
        descriptionLbl.text = dish.description
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
