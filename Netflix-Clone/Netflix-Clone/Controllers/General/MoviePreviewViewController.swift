//
//  MoviePreviewViewController.swift
//  Netflix-Clone
//
//  Created by Berk Canpolat on 10.02.2025.
//

import UIKit
import WebKit

class MoviePreviewViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.text = "Harry Potter"
        return label
    }()
    
    private let overViewLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "This is the best movie ever to watch as a kid!"
        label.numberOfLines = 0
        return label
    }()
    
    private let downloadButotn: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.setTitle("Download", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        return button
    }()
    
    private let webView: WKWebView = {
       let web = WKWebView()
        web.translatesAutoresizingMaskIntoConstraints = false
        
        return web
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        view.addSubview(titleLabel)
        view.addSubview(overViewLabel)
        view.addSubview(downloadButotn)
        
        configureConstraints()
        
        view.backgroundColor = .systemBackground

    }
    
    private func configureConstraints() {
        let webViewConstraints = [
            webView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.heightAnchor.constraint(equalToConstant: 350)
        ]
        
        let titleLabelConst = [
            titleLabel.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ]
        
        let overViewTitleConst = [
            overViewLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            overViewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            overViewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        
        let buttonConst = [
            downloadButotn.topAnchor.constraint(equalTo: overViewLabel.bottomAnchor, constant: 25),
            downloadButotn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            downloadButotn.widthAnchor.constraint(equalToConstant: 140),
            downloadButotn.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        
        
        NSLayoutConstraint.activate(webViewConstraints)
        NSLayoutConstraint.activate(titleLabelConst)
        NSLayoutConstraint.activate(overViewTitleConst)
        NSLayoutConstraint.activate(buttonConst)
    }
    
    func configure(with model: TitlePreviewModel) {
        titleLabel.text = model.title
        overViewLabel.text = model.titleOverView
        
        guard let url = URL(string: "https://www.youtube.com/embed/\(model.youtubeView.id.videoId)") else { return }
        webView.load(URLRequest(url: url))
    }
    

}
