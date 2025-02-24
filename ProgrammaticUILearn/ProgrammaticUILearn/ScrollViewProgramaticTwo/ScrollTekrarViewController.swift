//
//  ScrollTekrarViewController.swift
//  ProgrammaticUILearn
//
//  Created by Berk Canpolat on 22.02.2025.
//

import UIKit

class ScrollTekrarViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
       let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private let contentView: UIView = {
       let uv = UIView()
        uv.translatesAutoresizingMaskIntoConstraints = false
        return uv
    }()
    
    private let topView: UIView = {
       let uv = UIView()
        uv.translatesAutoresizingMaskIntoConstraints = false
        return uv
    }()
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Character"
        label.textColor = .white
        return label
    }()
    
    private let characterNameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Cloud Strife"
        label.numberOfLines = 0
        label.sizeToFit()
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        return label
    }()
    
    private let midView: UIView = {
       let uv = UIView()
        uv.translatesAutoresizingMaskIntoConstraints = false
        return uv
    }()
    
    private let characterDescription: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "aisdnfasikldfnilkasndfilkans asidlfnkasidkfnsad ilkdsfilaskdnfil sadnfkliansidklfnadsilk nfaisdlkfnasildkfn aslidkfnadsilkfnasdilkfn ialskdfnailskdnf likadnsfliaknsdfil asdilfnasidlnf ailksdfnilkansdfkli sadiflkn aisdknfasildkfn iaslkdfnilsakndfialsdkfn aisdlkfn alkiasdnflikdsanfilknsadf likasdnfaklnsidfilks"
        label.numberOfLines = 0
        label.sizeToFit()
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        return label
    }()
    
    private let heroImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "1")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    private func config() {
        view.backgroundColor = .systemFill
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        scrollView.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
        
        topLayout()
        midLayout()
    }
    
    private func topLayout() {
        contentView.addSubview(topView)
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: contentView.topAnchor),
            topView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            topView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            topView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        topView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        topView.addSubview(characterNameLabel)
        NSLayoutConstraint.activate([
            characterNameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            characterNameLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            characterNameLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor),
            characterNameLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor)
        ])
    }
    
    private func midLayout() {
        contentView.addSubview(midView)
        NSLayoutConstraint.activate([
            midView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            midView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            midView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            midView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        midView.addSubview(heroImage)
        NSLayoutConstraint.activate([
            heroImage.topAnchor.constraint(equalTo: midView.topAnchor, constant: 16),
            heroImage.leadingAnchor.constraint(equalTo: midView.leadingAnchor),
            heroImage.trailingAnchor.constraint(equalTo: midView.trailingAnchor),
            heroImage.heightAnchor.constraint(equalToConstant: 500)
        ])
        
        midView.addSubview(characterDescription)
        NSLayoutConstraint.activate([
            characterDescription.topAnchor.constraint(equalTo: heroImage.bottomAnchor, constant: 16),
            characterDescription.leadingAnchor.constraint(equalTo: midView.leadingAnchor),
            characterDescription.trailingAnchor.constraint(equalTo: midView.trailingAnchor),
            characterDescription.bottomAnchor.constraint(equalTo: midView.bottomAnchor)
        ])
    }

}
