//
//  StoryCollectionViewCell.swift
//  Collection-MultiSection-CompositionalLayout
//
//  Created by Berk Canpolat on 1.01.2025.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellImageView: UIImageView!
    
    func setup(_ item:ListItem) {
        cellImageView.image = UIImage(named: item.image)
        cellImageView.layoutIfNeeded()
        cellImageView.layer.cornerRadius = cellImageView.frame.height / 2
    }
    
    
}
