//
//  ViewController.swift
//  WeatherAppProgramatic
//
//  Created by Berk Canpolat on 20.03.2025.
//

import UIKit

class WeatherViewController: UIViewController {
    
    private lazy var backgroundView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        style()
        layout()
    }

}

extension WeatherViewController {
    func style() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.image = UIImage(named: "b2")
        backgroundView.contentMode = .scaleAspectFill
    }
    
    func layout() {
        view.addSubview(backgroundView)
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
