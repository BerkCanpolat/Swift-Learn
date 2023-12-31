//
//  HomeVC.swift
//  QuizApp
//
//  Created by Berk Canpolat on 30.12.2023.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func startButton(_ sender: Any) {
        performSegue(withIdentifier: "toQuiz", sender: nil)
    }
    

}
