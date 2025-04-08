//
//  HomeScreen.swift
//  UIKIT-MVVM-PROTOCOL-PROGRAMATIC
//
//  Created by Berk Canpolat on 7.04.2025.
//

import UIKit

protocol HomeScreenInterFace: AnyObject {
    func configureVC()
}

final class HomeScreen: UIViewController {
    
    private let viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
    


}

extension HomeScreen: HomeScreenInterFace {
    
    func configureVC() {
        view.backgroundColor = .systemPink
    }
    
}
