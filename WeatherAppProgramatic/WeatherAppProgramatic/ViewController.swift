//
//  ViewController.swift
//  WeatherAppProgramatic
//
//  Created by Berk Canpolat on 20.03.2025.
//

import UIKit

class WeatherViewController: UIViewController {
    
    private lazy var backgroundView = UIImageView()
    private lazy var locationButton = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        style()
        layout()
    }

}

extension WeatherViewController {
    func style() {
        /// Image Style
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.image = UIImage(named: "b2")
        backgroundView.contentMode = .scaleAspectFill
        
        /// Button Style
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        locationButton.setBackgroundImage(UIImage(systemName: "location.circle.fill"), for: .normal)
        locationButton.tintColor = .label
    }
    
    func layout() {
        view.addSubview(backgroundView)
        view.addSubview(locationButton)
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            locationButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            locationButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            locationButton.widthAnchor.constraint(equalToConstant: 40),
            locationButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
