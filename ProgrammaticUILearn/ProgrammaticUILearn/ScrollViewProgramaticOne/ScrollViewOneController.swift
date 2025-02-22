//
//  ScrollViewOneController.swift
//  ProgrammaticUILearn
//
//  Created by Berk Canpolat on 22.02.2025.
//

import UIKit

class ScrollViewOneController: UIViewController {
    
    private let scrollView: UIScrollView = {
       let sv = UIScrollView()
        sv.backgroundColor = .red
        return sv
    }()
    
    private let contentView: UIView = {
       let cv = UIView()
        cv.backgroundColor = .systemPurple
        return cv
    }()
    
    private let imageView: [UIImageView] = {
        var imageViews: [UIImageView] = []
        for x in 1...5 {
            let iv = UIImageView()
            iv.contentMode = .scaleAspectFill
            iv.image = UIImage(named: x.description)
            iv.clipsToBounds = true
            imageViews.append(iv)
        }
        return imageViews
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI () {
        view.backgroundColor = .systemBlue
        
        self.view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        self.scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        let hConst = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        hConst.isActive = true
        hConst.priority = UILayoutPriority(50)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -20),
            //contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
        
        view.addSubview(imageView[0])
        view.addSubview(imageView[1])
        view.addSubview(imageView[2])
        view.addSubview(imageView[3])
        view.addSubview(imageView[4])
        
        imageView[0].translatesAutoresizingMaskIntoConstraints = false
        imageView[1].translatesAutoresizingMaskIntoConstraints = false
        imageView[2].translatesAutoresizingMaskIntoConstraints = false
        imageView[3].translatesAutoresizingMaskIntoConstraints = false
        imageView[4].translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView[0].topAnchor.constraint(equalTo: self.contentView.topAnchor),
            imageView[0].leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            imageView[0].trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            imageView[0].heightAnchor.constraint(equalToConstant: 300),
            imageView[0].widthAnchor.constraint(equalTo: self.contentView.widthAnchor, constant: -20),
            
            imageView[1].topAnchor.constraint(equalTo: self.imageView[0].bottomAnchor),
            imageView[1].leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            imageView[1].trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            imageView[1].heightAnchor.constraint(equalToConstant: 300),
            imageView[1].widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            imageView[2].topAnchor.constraint(equalTo: self.imageView[1].bottomAnchor),
            imageView[2].leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            imageView[2].trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            imageView[2].heightAnchor.constraint(equalToConstant: 300),
            imageView[2].widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            imageView[3].topAnchor.constraint(equalTo: self.imageView[2].bottomAnchor),
            imageView[3].leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            imageView[3].trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            imageView[3].heightAnchor.constraint(equalToConstant: 300),
            imageView[3].widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            imageView[4].topAnchor.constraint(equalTo: self.imageView[3].bottomAnchor),
            //imageView[4].leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            //imageView[4].trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            imageView[4].centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            imageView[4].heightAnchor.constraint(equalToConstant: 300),
            imageView[4].widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            self.imageView[4].bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
    }
    

}
