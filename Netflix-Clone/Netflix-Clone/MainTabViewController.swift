//
//  ViewController.swift
//  Netflix-Clone
//
//  Created by Berk Canpolat on 6.02.2025.
//

import UIKit

class MainTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Ekranlarımızı tabbar içerisinde tek tek vermek yerine burada hepsini bir arada verdik ve kod tekrarını azalttık.
        setViewControllers([
            createNavController(for: HomeViewController(), title: "Home", imageName: "house"),
            createNavController(for: UpcomingViewController(), title: "Upcoming", imageName: "play.circle"),
            createNavController(for: SearchViewController(), title: "Search", imageName: "magnifyingglass"),
            createNavController(for: DownloadViewController(), title: "Downloads", imageName: "arrow.down.to.line")
        ], animated: true)
        
        /*let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: UpcomingViewController())
        let vc3 = UINavigationController(rootViewController: SearchViewController())
        let vc4 = UINavigationController(rootViewController: DownloadViewController())*/
        
        /*vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "play.circle")
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc4.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")*/
        
        /*vc1.title = "Home"
        vc2.title = "Upcoming"
        vc3.title = "Search"
        vc4.title = "Downloads"*/
        
        tabBar.tintColor = .label
        
        /*setViewControllers([vc1,vc2,vc3,vc4], animated: true)*/
    }
    
    /// Daha modüler bir yapı.
    private func createNavController(for rootViewController: UIViewController, title: String, imageName: String) -> UINavigationController {
            let navController = UINavigationController(rootViewController: rootViewController)
            navController.tabBarItem.title = title
            navController.tabBarItem.image = UIImage(systemName: imageName)
            return navController
        }


}

