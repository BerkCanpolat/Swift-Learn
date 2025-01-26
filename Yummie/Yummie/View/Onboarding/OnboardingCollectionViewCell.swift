//
//  OnboardingCollectionViewCell.swift
//  Yummie
//
//  Created by Berk Canpolat on 26.01.2025.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    /// String(describing:) bir türün veya bir nesnenin adını string (metin) olarak döndürür.
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLbl: UILabel!
    @IBOutlet weak var slideDescriptionLbl: UILabel!
    
    func setup(_ slide: OnboardingSlide) {
        slideImageView.image = slide.image
        slideTitleLbl.text = slide.title
        slideDescriptionLbl.text = slide.description
    }
}
