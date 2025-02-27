//
//  ProfileHaeader.swift
//  ProgrammaticUILearn
//
//  Created by Berk Canpolat on 27.02.2025.
//

import UIKit


class ProfileHaeader: UICollectionReusableView {
    
    static let identifier = "ProfileHaeader"
    
    //MARK: - Propertys
    
    lazy var profileImageView: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "1")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        return image
    }()
    
    lazy var removeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(.remove.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handleMessageRemove), for: .touchUpInside)
        button.isUserInteractionEnabled = true
        return button
    }()
    
    lazy var checkButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(.checkmark.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handleMessageCheck), for: .touchUpInside)
        return button
    }()
    
    lazy var thirtyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(.add.withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    lazy var nameLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.text = "Eddie Brock"
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = .white
        return label
    }()
    
    lazy var emailLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.text = "venom@gmail.com"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBlue
        //layer.cornerRadius = 10
        
        addSubview(profileImageView)
        profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        profileImageView.anchorx(top: topAnchor, paddingTop: 88, width: 120, height: 120)
        profileImageView.layer.cornerRadius = 120 / 2
        
        addSubview(removeButton)
        removeButton.anchorx(top: topAnchor, left: leftAnchor, paddingTop: 64, paddingLeft: 32, width: 32, height: 32)
        
        addSubview(checkButton)
        checkButton.anchorx(top: topAnchor, right: rightAnchor, paddingTop: 64, paddingRight: 32, width: 32, height: 32)
        
        addSubview(thirtyButton)
        thirtyButton.anchorx(top: topAnchor, left: checkButton.rightAnchor, paddingTop: 64, paddingLeft: 0, width: 32, height: 32)
        
        addSubview(nameLabel)
        nameLabel.anchorx(top: profileImageView.bottomAnchor, left: leftAnchor, right: rightAnchor ,paddingTop: 12)
        
        addSubview(emailLabel)
        emailLabel.anchorx(top: nameLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 12)
        
    }
    
    required init?(coder:NSCoder) {
        fatalError()
    }
    
    //MARK: -FUNCTIONS
    @objc func handleMessageRemove() {
        print("Remove Clicked")
    }
    
    @objc func handleMessageCheck() {
        print("Checked Clicked")
    }
}
