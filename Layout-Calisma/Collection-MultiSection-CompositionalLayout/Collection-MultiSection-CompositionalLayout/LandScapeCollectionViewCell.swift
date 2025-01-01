//
//  LandScapeCollectionViewCell.swift
//  Collection-MultiSection-CompositionalLayout
//
//  Created by Berk Canpolat on 1.01.2025.
//

import UIKit

class LandScapeCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var cellImageView: UIImageView!
    
    @IBOutlet weak var cellTitleLbl: UILabel!
    
    func setup(_ item:ListItem) {
        cellImageView.image = UIImage(named: item.image)
        cellTitleLbl.text = item.title
    }
    
    
}
