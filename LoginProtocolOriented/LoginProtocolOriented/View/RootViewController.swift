//
//  ViewController.swift
//  LoginProtocolOriented
//
//  Created by Berk Canpolat on 23.01.2025.
//

import UIKit

class RootViewController: UIViewController, RootViewModelProtocol{
    
    private let viewModel : RootViewModel
    
    init(viewModel: RootViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.output = self
    }
    
    required init?(coder:NSCoder) {
        fatalError("")
    }
    
    func showLogin() {
        let loginViewController = LoginViewController()
        navigationController?.present(loginViewController, animated: true)
    }
    
    func showMainApp() {
        let mainViewController = MainViewController()
        navigationController?.present(mainViewController, animated: true)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        viewModel.checkLogin()
    }


}

