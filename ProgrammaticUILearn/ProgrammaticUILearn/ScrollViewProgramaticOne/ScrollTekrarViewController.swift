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
        sv.backgroundColor = .red
        return sv
    }()
    
    private let contentView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let image:[UIImageView] = {
        var img: [UIImageView] = []
        for x in 1...5 {
            let i = UIImageView()
            i.contentMode = .scaleAspectFill
            i.image = UIImage(named: x.description)
            img.append(i)
        }
        return img
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        view.backgroundColor = .systemFill
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        let degisken = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        degisken.isActive = true
        degisken.priority = UILayoutPriority(50)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
        
        
        view.addSubview(image[0])
        view.addSubview(image[1])
        view.addSubview(image[2])
        view.addSubview(image[3])
        view.addSubview(image[4])
        
        image[0].translatesAutoresizingMaskIntoConstraints = false
        image[1].translatesAutoresizingMaskIntoConstraints = false
        image[2].translatesAutoresizingMaskIntoConstraints = false
        image[3].translatesAutoresizingMaskIntoConstraints = false
        image[4].translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            image[0].topAnchor.constraint(equalTo: contentView.topAnchor),
            image[0].leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image[0].trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            image[0].widthAnchor.constraint(equalTo: contentView.widthAnchor),
            image[0].heightAnchor.constraint(equalToConstant: 300),
            
            image[1].topAnchor.constraint(equalTo: image[0].bottomAnchor),
            image[1].leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image[1].trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            image[1].widthAnchor.constraint(equalTo: contentView.widthAnchor),
            image[1].heightAnchor.constraint(equalToConstant: 300),
            
            image[2].topAnchor.constraint(equalTo: image[1].bottomAnchor),
            image[2].leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image[2].trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            image[2].widthAnchor.constraint(equalTo: contentView.widthAnchor),
            image[2].heightAnchor.constraint(equalToConstant: 300),
            
            image[3].topAnchor.constraint(equalTo: image[2].bottomAnchor),
            image[3].leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image[3].trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            image[3].widthAnchor.constraint(equalTo: contentView.widthAnchor),
            image[3].heightAnchor.constraint(equalToConstant: 300),
            
            image[4].topAnchor.constraint(equalTo: image[3].bottomAnchor),
            image[4].leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image[4].trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            image[4].widthAnchor.constraint(equalTo: contentView.widthAnchor),
            image[4].heightAnchor.constraint(equalToConstant: 300),
            
            image[4].bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

}
