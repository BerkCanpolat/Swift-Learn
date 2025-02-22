//
//  AutoLayoutController.swift
//  ProgrammaticUILearn
//
//  Created by Berk Canpolat on 22.02.2025.
//

import UIKit

class AutoLayoutController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        
        let view1 = createView(color: .red, cornerRadius: 50)
        let view2 = createView(color: .red, cornerRadius: 25)
        let view3 = createView(color: .red, cornerRadius: 25)
        let view4 = createView(color: .red, cornerRadius: 25)
        let view5 = createView(color: .red, cornerRadius: 25)
        
        
        
        setWidthHeightTranslate(subview: view1, width: 100, height: 100)
        view1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        view1.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        setWidthHeightTranslate(subview: view2, width: 50, height: 50)
        view2.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        view2.rightAnchor.constraint(equalTo: view1.leftAnchor, constant: -10).isActive = true
        
        setWidthHeightTranslate(subview: view3, width: 50, height: 50)
        view3.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        view3.bottomAnchor.constraint(equalTo: view1.topAnchor, constant: -10).isActive = true
        
        setWidthHeightTranslate(subview: view4, width: 50, height: 50)
        view4.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        view4.leftAnchor.constraint(equalTo: view1.rightAnchor, constant:  10).isActive = true
        
        setWidthHeightTranslate(subview: view5, width: 50, height: 50)
        view5.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        view5.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: 10).isActive = true
        

    }
    
    func setWidthHeightTranslate(subview: UIView, width: CGFloat, height: CGFloat) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.widthAnchor.constraint(equalToConstant: width).isActive = true
        subview.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func createView(color: UIColor, cornerRadius: CGFloat) -> UIView {
        let cview = UIView()
        cview.backgroundColor = color
        view.addSubview(cview)
        cview.layer.cornerRadius = cornerRadius
        return cview
    }

}
