//
//  UserInfoHeader.swift
//  ProgrammaticUILearn
//
//  Created by Berk Canpolat on 1.03.2025.
//

import UIKit

class UserInfoHeader: UIView {
    
    //MARK: - Propertys
    
    private lazy var profileImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "1")
        iv.layer.cornerRadius = 60 / 2
        return iv
    }()
    
    lazy var userNamelabel: UILabel = {
        let label = UILabel()
        label.text = "Tony Stark"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "tony.stark@gmail.com"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let profileImageDimension: CGFloat = 60
        
        addSubview(profileImage)
        addSubview(userNamelabel)
        addSubview(emailLabel)
        NSLayoutConstraint.activate([
            profileImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            profileImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            profileImage.widthAnchor.constraint(equalToConstant: profileImageDimension),
            profileImage.heightAnchor.constraint(equalToConstant: profileImageDimension),
            
            userNamelabel.centerYAnchor.constraint(equalTo: profileImage.centerYAnchor, constant: -10),
            userNamelabel.leftAnchor.constraint(equalTo: profileImage.rightAnchor, constant: 12),
            
            emailLabel.centerYAnchor.constraint(equalTo: profileImage.centerYAnchor, constant: 10),
            emailLabel.leftAnchor.constraint(equalTo: profileImage.rightAnchor, constant: 12)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
