//
//  SearchTekrarViewController.swift
//  ProgrammaticUILearn
//
//  Created by Berk Canpolat on 22.02.2025.
//

import UIKit

class SearchTekrarViewController: UIViewController {
    
    let searchController = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        tekrarConfig()
    }
    
    @objc func handleShowSearch() {
        search(showBool: true)
        searchController.becomeFirstResponder()
    }
    
    private func tekrarConfig() {
        view.backgroundColor = .white
        
        searchController.sizeToFit()
        
        searchController.delegate = self
        
        navigationItem.title = "Tekrar Search"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        let app = UINavigationBarAppearance()
        
        app.backgroundColor = .brown
        app.titleTextAttributes = [.foregroundColor: UIColor.white]
        app.largeTitleTextAttributes = [.foregroundColor:UIColor.white]
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.tintColor = .white
        
        
        navigationController?.navigationBar.scrollEdgeAppearance = app
        navigationController?.navigationBar.standardAppearance = app
        navigationController?.navigationBar.compactAppearance = app
        
        showSearch(showBool: true)
    }
    
    func showSearch(showBool: Bool) {
        if showBool {
            let item = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleShowSearch))
            
            navigationItem.rightBarButtonItem = item
        } else {
            navigationItem.rightBarButtonItem = nil
        }
    }
    
    func search(showBool: Bool) {
        showSearch(showBool: !showBool)
        searchController.showsCancelButton = showBool
        navigationItem.titleView = showBool ? searchController : nil
    }

}

extension SearchTekrarViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
       search(showBool: false)
        
    }
}
