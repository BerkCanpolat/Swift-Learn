//
//  CollectionInstagramViewController.swift
//  ProgrammaticUILearn
//
//  Created by Berk Canpolat on 27.02.2025.
//

import UIKit

class UserProfileProgrammatically: UIViewController {
    
    //MARK: - UIElements
    lazy var containerView: UIView = {
       let view = UIView()
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 10
        view.addSubview(profileImageView)
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageView.anchor(top: view.topAnchor, paddingTop: 54, width: 120, height: 120)
        profileImageView.layer.cornerRadius = 120 / 2
        
        view.addSubview(removeButton)
        removeButton.anchor(top: view.topAnchor, left: view.leftAnchor, paddingTop: 10, paddingLeft: 32, width: 32, height: 32)
        
        view.addSubview(checkButton)
        checkButton.anchor(top: view.topAnchor, right: view.rightAnchor, paddingTop: 10, paddingRight: 32, width: 32, height: 32)
        
        view.addSubview(thirtyButton)
        thirtyButton.anchor(top: view.topAnchor, left: checkButton.rightAnchor, paddingTop: 10, paddingLeft: 0, width: 32, height: 32)
        
        view.addSubview(nameLabel)
        nameLabel.anchor(top: profileImageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor ,paddingTop: 12)
        
        view.addSubview(emailLabel)
        emailLabel.anchor(top: nameLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 12)
        
        return view
    }()
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemFill
        
        view.addSubview(containerView)
        
        
        
        containerView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0,height: 300)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @objc func handleMessageRemove() {
        print("Remove Clicked")
    }
    
    @objc func handleMessageCheck() {
        print("Checked Clicked")
    }


}

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, paddingTop: CGFloat? = 0, paddingLeft: CGFloat? = 0, paddingBottom: CGFloat? = 0, paddingRight: CGFloat? = 0, width: CGFloat? = nil, height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            if let paddingTop = paddingTop {
                topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
            }
        }
        
        if let left = left {
            if let paddingLeft = paddingLeft {
                leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
            }
        }
        
        if let right = right {
            if let paddingRight = paddingRight {
                rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
            }
        }
        
        if let bottom = bottom {
            if let paddingBottom = paddingBottom {
                bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
            }
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
    }
}
