//
//  NavigationViewController.swift
//  ProgrammaticUILearn
//
//  Created by Berk Canpolat on 1.03.2025.
//

import UIKit

class NavigationViewController: UIViewController {
    
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        
        button.setTitle("Go To Nav Controller", for: .normal)
        view.addSubview(button)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 52)
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton() {
        let destinateVC = SecondViewController()
        let navVC = UINavigationController(rootViewController: destinateVC)
        
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
        
        //let den = SecondViewController()
        
        //navigationController?.pushViewController(den, animated: true)
    }
}


class SecondViewController: UIViewController {
    
    private let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemRed
        
        navigationItem.title = "Second View"
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.red]
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Dismiss", style: .plain, target: self, action: #selector(dismissSelf))
        
        button.setTitle("Push Another Controller", for: .normal)
        view.addSubview(button)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 52)
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc private func didTapButton() {
        let vc = ThreeViewControllerPage()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
}


class ThreeViewControllerPage: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBrown
        
        navigationItem.title = "Three View"
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.red]
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Dismiss", style: .plain, target: self, action: #selector(dismissSelf))
    }
    
    @objc private func dismissSelf() {
        //navigationController?.popViewController(animated: true)
        navigationController?.popToRootViewController(animated: true)
    }
}
