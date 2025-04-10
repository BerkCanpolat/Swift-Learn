//
//  HomeViewModel.swift
//  UIKIT-MVVM-PROTOCOL-PROGRAMATIC
//
//  Created by Berk Canpolat on 8.04.2025.
//

import Foundation

protocol HomeViewModelInterface {
    var view: HomeScreenInterFace? { get set }
    func viewDidLoad()
}

final class HomeViewModel {
    weak var view: HomeScreenInterFace?
}


extension HomeViewModel: HomeViewModelInterface {
    func viewDidLoad() {
        print("View Model Deneme")
        view?.configureVC()
        view?.configureCollectionView()
    }
    
}
