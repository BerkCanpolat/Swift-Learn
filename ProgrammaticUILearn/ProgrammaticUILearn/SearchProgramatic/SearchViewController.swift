//
//  SearchViewController.swift
//  ProgrammaticUILearn
//
//  Created by Berk Canpolat on 19.02.2025.
//

import UIKit

class SearchViewController: UIViewController {
    
    let searchBar = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }


    func configureUI() {
        view.backgroundColor = .white
        
        searchBar.delegate = self
        
        searchBar.sizeToFit()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Search Bar"
        
        let appereance = UINavigationBarAppearance()
        appereance.configureWithOpaqueBackground()
        //appereance.backgroundColor = UIColor(red: 55/255, green: 120/255, blue: 250/255, alpha: 1)
        appereance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appereance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.isTranslucent = false
        
        navigationController?.navigationBar.standardAppearance = appereance
        navigationController?.navigationBar.scrollEdgeAppearance = appereance
        navigationController?.navigationBar.compactAppearance = appereance
        
        showSearchButton(shouldShow: true)
    }
    
    @objc func handleShowSearchBar() {
        search(shouldShow: true)
        searchBar.becomeFirstResponder()
    }
    
    func search(shouldShow: Bool) {
        showSearchButton(shouldShow: !shouldShow)
        searchBar.showsCancelButton = shouldShow
        navigationItem.titleView = shouldShow ? searchBar : nil
        
    }
    
    func showSearchButton(shouldShow: Bool) {
        if shouldShow {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleShowSearchBar))
        } else {
            navigationItem.rightBarButtonItem = nil
        }
    }

}

extension SearchViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search(shouldShow: false)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Search: \(searchText)")
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("Searchbar end editing")
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("Searchbar begin editing")
    }
}
