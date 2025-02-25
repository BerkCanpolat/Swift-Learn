//
//  PageCollectionViewCell.swift
//  ProgrammaticUILearn
//
//  Created by Berk Canpolat on 25.02.2025.
//

import UIKit

class PageCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PageCollectionViewCell"
    
    var page: Page? {
        didSet {
            print(page?.imageName ?? "")
            print(page?.headerText ?? "")
            bearImageView.image = UIImage(named: page?.imageName ?? "")
            
            let attributedText = NSMutableAttributedString(string: page?.headerText ?? "", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
            
            let additionalText = NSAttributedString(string: page?.bodyText ?? "", attributes: [
                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13),
                    NSAttributedString.Key.foregroundColor: UIColor.gray
                ])
            attributedText.append(additionalText)
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
            
            
        }
    }
    
    private lazy var bearImageView: UIImageView = {
        var img = UIImage(named: "1")
        let imageView = UIImageView(image: img)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var descriptionTextView: UITextView = {
        let text = UITextView()
        let attributedText = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
        
        let additionalText = NSAttributedString(string: "\nAre you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon.", attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13),
                NSAttributedString.Key.foregroundColor: UIColor.gray
            ])
        attributedText.append(additionalText)
        text.attributedText = attributedText
        text.textAlignment = .center
        text.translatesAutoresizingMaskIntoConstraints = false
        text.isEditable = false
        text.isScrollEnabled = false
        return text
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //backgroundColor = .purple
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        let topImageContainerView = UIView()
        addSubview(topImageContainerView)
        
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        topImageContainerView.addSubview(bearImageView)
        bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        bearImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        addSubview(descriptionTextView)
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: 5).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
}
