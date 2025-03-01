//
//  FollowTableViewCell.swift
//  ProgrammaticUILearn
//
//  Created by Berk Canpolat on 1.03.2025.
//

import UIKit

protocol UserCellDelegate {
    func onFollowTap(cell: FollowTableViewCell)
}

class FollowTableViewCell: UITableViewCell {
    
    static let identifier = "FollowTableViewCell"
    
    var delegate: UserCellDelegate?
    
    var user: UserModel? {
        didSet {
            profileImageView.image = user?.profileImage
            userNameLabel.text = user?.userName
            fullNameLabel.text = user?.fullName
        }
    }

    lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Username"
        return label
    }()
    
    lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .lightGray
        label.text = "Sub Name"
        return label
    }()
    
    lazy var profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .lightGray
        return iv
    }()
    
    lazy var followButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Follow", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(handleFollowTapped), for: .touchUpInside)
        button.layer.cornerRadius = 5
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none
        
        contentView.addSubview(profileImageView)
        let dimension: CGFloat = 60
        
        profileImageView.centerOnYAxis(inView: self, constant: 0)
            profileImageView.anchorFollow(top: nil, bottom: nil, left: leftAnchor, right: nil, paddingTop: 0, paddingBottom: 0 ,paddingLeft: 8, paddingRight: 0, width: dimension, height: dimension)
        profileImageView.layer.cornerRadius = dimension / 2
        
        contentView.addSubview(userNameLabel)
        userNameLabel.anchorFollow(top: nil, bottom: nil, left: profileImageView.rightAnchor, right: nil, paddingTop: 0, paddingBottom: 0, paddingLeft: 8, paddingRight: 0)
        userNameLabel.centerOnYAxis(inView: self, constant: -12)
        
        contentView.addSubview(fullNameLabel)
        fullNameLabel.anchorFollow(top: nil, bottom: nil, left: profileImageView.rightAnchor, right: nil, paddingTop: 0, paddingBottom: 0, paddingLeft: 8, paddingRight: 0)
        fullNameLabel.centerOnYAxis(inView: self, constant: 12)
        
        contentView.addSubview(followButton)
        followButton.anchorFollow(top: nil, bottom: nil, left: nil, right: rightAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 8, width: 100, height: 32)
        followButton.centerOnYAxis(inView: self, constant: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleFollowTapped() {
        delegate?.onFollowTap(cell: self)
    }
    
}
