//
//  UIViewController+Extension.swift
//  Yummie
//
//  Created by Berk Canpolat on 27.01.2025.
//

import UIKit

extension UIViewController {
    static var identifier: String {
        return String(describing: self)
    }
    
    static func instantiate() -> Self {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        return storyBoard.instantiateViewController(withIdentifier: identifier) as! Self
        
    }
}
