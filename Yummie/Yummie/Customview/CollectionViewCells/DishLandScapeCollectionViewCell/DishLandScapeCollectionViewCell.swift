//
//  DishLandScapeCollectionViewCell.swift
//  Yummie
//
//  Created by Berk Canpolat on 27.01.2025.
//

import UIKit

class DishLandScapeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: DishLandScapeCollectionViewCell.self)
    
    @IBOutlet weak var disImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    
    func setup(dish:Dish) {
        disImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
        caloriesLbl.text = dish.formattedCalories
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
