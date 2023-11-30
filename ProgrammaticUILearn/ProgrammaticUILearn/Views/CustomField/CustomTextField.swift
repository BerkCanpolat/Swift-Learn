//
//  CustomTextField.swift
//  ProgrammaticUILearn
//
//  Created by Berk Canpolat on 20.11.2023.
//

import UIKit

class CustomTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        config()
    }
    
    required init(coder: NSCoder) {
        fatalError("bla bla")
    }
    
    convenience init(secureText: Bool, colorText: UIColor, holderPlace: String) {
        self.init(frame: .zero)
        set(secureText: secureText, colorText: colorText, holderPlace: holderPlace)
    }
    
    func config() {
        placeholder = "Şifre giriniz"
        layer.cornerRadius = 10
        backgroundColor = .lightGray
        tintColor = .red
    }
    
    private func set(secureText: Bool, colorText: UIColor, holderPlace: String) {
        isSecureTextEntry = secureText
        textColor = colorText
        placeholder = holderPlace
    }
    

}
