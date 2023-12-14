//
//  ViewController.swift
//  TabbarKullanimi
//
//  Created by Berk Canpolat on 14.12.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let tabItems = tabBarController?.tabBar.items {
            let anasayfaItem = tabItems[0]
            let ayarlarItem = tabItems[1]
            
            anasayfaItem.badgeValue = "3"
            ayarlarItem.badgeValue = "Yeni"
        }
        
        let app = UITabBarAppearance()
        
        app.backgroundColor = UIColor.systemIndigo
        
        renkDegis(item: app.stackedLayoutAppearance)
        renkDegis(item: app.compactInlineLayoutAppearance)
        renkDegis(item: app.inlineLayoutAppearance)
        
        tabBarController?.tabBar.standardAppearance = app
        tabBarController?.tabBar.scrollEdgeAppearance = app
        
    }
    
    func renkDegis(item:UITabBarItemAppearance) {
        //Seçili Olan Durum
        item.selected.iconColor = UIColor.systemOrange
        item.selected.titleTextAttributes = [.foregroundColor: UIColor.systemOrange]
        item.selected.badgeBackgroundColor = .systemMint
        
        //Seçili Olmayan Durum
        item.normal.iconColor = UIColor.white
        item.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
        item.normal.badgeBackgroundColor = .lightGray
    }


}

