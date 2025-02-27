//
//  ProfileCell.swift
//  ProgrammaticUILearn
//
//  Created by Berk Canpolat on 27.02.2025.
//

import UIKit

class ProfileCell: UICollectionViewCell {
    
    static let identifier = "ProfileCell"
    
    lazy var profileImageView: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "1")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        //image.layer.borderWidth = 3
        //image.layer.borderColor = UIColor.white.cgColor
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(profileImageView)
        
        profileImageView.anchorx(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
