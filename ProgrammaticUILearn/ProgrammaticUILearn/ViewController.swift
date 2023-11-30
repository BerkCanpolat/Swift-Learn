//
//  ViewController.swift
//  ProgrammaticUILearn
//
//  Created by Berk Canpolat on 20.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    lazy var emailField = CustomTextField(secureText: false, colorText: UIColor.blue, holderPlace: "Email Girin")
    
    lazy var passwordField = CustomTextField(secureText: true, colorText: UIColor.green, holderPlace: "Şifre Girin")
    
    
    lazy var loginButton: UIButton = {
        
        let buton = UIButton(type: UIButton.ButtonType.system)
        
        buton.setTitle("Giriş", for: UIControl.State.normal)
        buton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        buton.backgroundColor = .black
        buton.layer.cornerRadius = 25
        
        return buton
        
        
    }()
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        extensionCustomLayout()
        goTo()
    }
    
    
    //MARK: - Helpers
    func extensionCustomLayout() {
        view.backgroundColor = .red
        view.addSubviewExtension(emailField,passwordField,loginButton)
        
        emailField.editAnchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 50, paddingLeft: 80, paddingRight: 80, height: 40)
        
        passwordField.editAnchor(top: emailField.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 30, paddingLeft: 80,paddingRight: 80, height: 40)
        
        loginButton.editAnchor(top: passwordField.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 60, paddingLeft: 100,paddingRight: 100, height: 40)
    }
    
    func setupUI(){
        view.backgroundColor = .red
        
        configureEmailField()
        configurePassword()
        girisButonu()
    }
    
    
    
    func configureEmailField() {
        view.addSubview(emailField)
        emailField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            emailField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configurePassword() {
        view.addSubview(passwordField)
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 30),
            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            passwordField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func girisButonu() {
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 60),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    //MARK: - Navigation
    
    func goTo() {
        loginButton.addTarget(self, action: #selector(self.navigate), for: UIControl.Event.touchUpInside)
    }
    
    @objc func navigate() {
        navigationController?.pushViewController(HomePageVC(), animated: true)
    }
    
    


}

