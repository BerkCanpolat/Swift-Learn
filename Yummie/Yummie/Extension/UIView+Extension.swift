//
//  UIView+Extension.swift
//  Yummie
//
//  Created by Berk Canpolat on 26.01.2025.
//

import UIKit

extension UIView {
    /// [@IBInspectable] -> Bu özellik sayesinde storyboard interface üzerinde cornerradius özelliğini ekleyip oradan değiştirebiliyoruz.
    /// Set -> Kullanıcının girdiği cornerradius değerini veriyor
    /// Get -> Set'te verdiğimiz değeri döndürüyor.
    @IBInspectable var cornerRadius: CGFloat {
        get{return self.layer.cornerRadius}
        set{
            self.layer.cornerRadius = newValue
        }
    }
}
