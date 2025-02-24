//
//  OnboardingScreenViewController.swift
//  ProgrammaticUILearn
//
//  Created by Berk Canpolat on 24.02.2025.
//

import UIKit

class OnboardingScreenViewController: UIViewController {
    
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
        
        //text.text = "Join us today in our fun and games!"
        //text.font = UIFont.boldSystemFont(ofSize: 18)
        text.textAlignment = .center
        text.translatesAutoresizingMaskIntoConstraints = false
        text.isEditable = false
        text.isScrollEnabled = false
        return text
    }()



    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        //view.addSubview(bearImageView)
        view.addSubview(descriptionTextView)
        //imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)

        
        setupLayout()
    }
    
    private func setupLayout() {
        let topImageContainerView = UIView()
        //topImageContainerView.backgroundColor = .blue
        view.addSubview(topImageContainerView)
        //topImageContainerView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        topImageContainerView.addSubview(bearImageView)
        bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        bearImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        //bearImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //bearImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        //bearImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: 120).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}
