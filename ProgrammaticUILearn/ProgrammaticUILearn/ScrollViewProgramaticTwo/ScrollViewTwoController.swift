//
//  ScrollViewTwoController.swift
//  ProgrammaticUILearn
//
//  Created by Berk Canpolat on 22.02.2025.
//

import UIKit

class ScrollViewTwoController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        configureUI()
    }
    
    let scrollView: UIScrollView = {
       let sc = UIScrollView()
        sc.showsVerticalScrollIndicator = true
        sc.isDirectionalLockEnabled = true
        sc.showsHorizontalScrollIndicator = false
        sc.translatesAutoresizingMaskIntoConstraints = false
        return sc
    }()
    
    let contentView: UIView = {
       let cv = UIView()
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    let topView: UIView = {
       let tv = UIView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    let titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Character"
        return label
    }()
    
    let characterNameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Cloud Strife"
        label.numberOfLines = 0
        label.sizeToFit()
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let midView: UIView = {
       let tv = UIView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    let characterImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "1")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let characterDescription: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "aisdnfasikldfnilkasndfilkans asidlfnkasidkfnsad ilkdsfilaskdnfil sadnfkliansidklfnadsilk nfaisdlkfnasildkfn aslidkfnadsilkfnasdilkfn ialskdfnailskdnf likadnsfliaknsdfil asdilfnasidlnf ailksdfnilkansdfkli sadiflkn aisdknfasildkfn iaslkdfnilsakndfialsdkfn aisdlkfn alkiasdnflikdsanfilknsadf likasdnfaklnsidfilks"
        label.numberOfLines = 0
        label.sizeToFit()
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    func configureUI() {
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        scrollView.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leftAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.contentLayoutGuide.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
        
        configureTopView()
        configureMiddleView()
    }
    
    func configureTopView() {
        contentView.addSubview(topView)
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: contentView.topAnchor),
            topView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            topView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            topView.heightAnchor.constraint(lessThanOrEqualToConstant: 150)
        ])
        
        topView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topView.topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: topView.leftAnchor),
            titleLabel.rightAnchor.constraint(equalTo: topView.rightAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        topView.addSubview(characterNameLabel)
        NSLayoutConstraint.activate([
            characterNameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            characterNameLabel.leftAnchor.constraint(equalTo: topView.leftAnchor),
            characterNameLabel.rightAnchor.constraint(equalTo: topView.rightAnchor),
            characterNameLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor)
        ])
    }
    
    func configureMiddleView() {
        contentView.addSubview(midView)
        NSLayoutConstraint.activate([
            midView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            midView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            midView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            midView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        midView.addSubview(characterImage)
        NSLayoutConstraint.activate([
            characterImage.topAnchor.constraint(equalTo: midView.topAnchor, constant: 16),
            characterImage.leftAnchor.constraint(equalTo: midView.leftAnchor),
            characterImage.rightAnchor.constraint(equalTo: midView.rightAnchor),
            characterImage.heightAnchor.constraint(equalToConstant: 500)
        ])
        
        midView.addSubview(characterDescription)
        NSLayoutConstraint.activate([
            characterDescription.topAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 10),
            characterDescription.leftAnchor.constraint(equalTo: midView.leftAnchor),
            characterDescription.rightAnchor.constraint(equalTo: midView.rightAnchor),
            characterDescription.bottomAnchor.constraint(equalTo: midView.bottomAnchor)
        ])
    }



}
