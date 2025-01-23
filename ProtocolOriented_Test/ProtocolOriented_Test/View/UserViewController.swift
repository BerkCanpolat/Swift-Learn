//
//  ViewController.swift
//  ProtocolOriented_Test
//
//  Created by Berk Canpolat on 23.01.2025.
//

import UIKit

class UserViewController: UIViewController, UserViewModelProtocol {
    
    func updateView(name: String, email: String, userName: String) {
        self.nameLabel.text = name
        self.userNameLabel.text = userName
        self.emailLabel.text = email
    }
    
    
    private let viewModel : UserViewModel
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.output = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init")
    }
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let userNameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let emailLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        //fetchUsers()
        viewModel.fetchUsers()
        
    }
    
    private func setupViews() {
        view.backgroundColor = .systemYellow
        view.addSubview(emailLabel)
        view.addSubview(nameLabel)
        view.addSubview(userNameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 60),
            nameLabel.widthAnchor.constraint(equalToConstant: 200),
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
            emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailLabel.heightAnchor.constraint(equalToConstant: 60),
            emailLabel.widthAnchor.constraint(equalToConstant: 200),
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            
            userNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userNameLabel.heightAnchor.constraint(equalToConstant: 60),
            userNameLabel.widthAnchor.constraint(equalToConstant: 200),
            userNameLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
        ])
        
        nameLabel.text = "Name LABEL"
        emailLabel.text = "EMAİL LABEL"
        userNameLabel.text = "USER NAME LABEL"
    }
    
    /*private func fetchUsers() {
        APIManager.shared.fetchUser { result in
            switch result {
            case .success(let user):
                self.userNameLabel.text = user.username
                self.emailLabel.text = user.email
                self.nameLabel.text = user.name
            case .failure:
                self.nameLabel.text = "No user found"
            }
        }
    } */


}

