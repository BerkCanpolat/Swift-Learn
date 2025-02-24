//
//  SegmentedControlViewController.swift
//  ProgrammaticUILearn
//
//  Created by Berk Canpolat on 24.02.2025.
//

import UIKit

class SegmentedControlViewController: UIViewController {
    
    var items = ["Blue","White","Green"]
    let haptic = UISelectionFeedbackGenerator()
    
    private lazy var segmentedControl: UISegmentedControl = {
        let view = UISegmentedControl(items: items)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.selectedSegmentTintColor = .white
        //view.backgroundColor = .red
        view.setTitleTextAttributes([.foregroundColor : UIColor.black], for: .selected)
        view.setTitleTextAttributes([.foregroundColor : UIColor.white], for: .normal)
        view.addTarget(self, action: #selector(colorChanged), for: .valueChanged)
        view.selectedSegmentIndex = 0
        return view
    }()
    
    private lazy var colorView: UIView = {
        let color = UIView()
        color.translatesAutoresizingMaskIntoConstraints = false
        color.backgroundColor = .systemBlue
        return color
    }()


    override func viewDidLoad() {
        haptic.prepare()
        super.viewDidLoad()
        
        view.backgroundColor = .systemFill
        
        view.addSubview(segmentedControl)
        view.addSubview(colorView)
        
        NSLayoutConstraint.activate([
            //segmentedControl.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
            //segmentedControl.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            //segmentedControl.trailingAnchor.constraint(equalToSystemSpacingAfter: view.trailingAnchor, multiplier: 4),
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            colorView.widthAnchor.constraint(equalToConstant: 200),
            colorView.heightAnchor.constraint(equalToConstant: 200),
            colorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            colorView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

    }
    
    @objc func colorChanged() {
        haptic.selectionChanged()
        switch segmentedControl.selectedSegmentIndex {
        case 0: colorView.backgroundColor = .blue
        case 1: colorView.backgroundColor = .white
        case 2: colorView.backgroundColor = .green
        default: colorView.backgroundColor = .systemFill
        }
    }

}
