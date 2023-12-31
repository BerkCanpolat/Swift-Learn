//
//  QuizVC.swift
//  QuizApp
//
//  Created by Berk Canpolat on 30.12.2023.
//

import UIKit

class QuizVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var quizViewModel = QuizViewModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self

        verileriGetir()
    }
    
    
    func verileriGetir() {
        quizViewModel.fetchDatax {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    
    
    
    @IBAction func sinaviBitirClicked(_ sender: Any) {
    }
    
    
    @IBAction func soruyuGecClicked(_ sender: Any) {
    }
    
}


extension QuizVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return quizViewModel.numberOfItemsInsection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! QuestionCell
        
        if let item = quizViewModel.questionID(at: indexPath.row) {
            cell.questionLabel.text = item.question
            cell.option1.setTitle(item.option_1, for: .normal)
            cell.option2.setTitle(item.option_2, for: .normal)
            cell.option3.setTitle(item.option_3, for: .normal)
            cell.option4.setTitle(item.option_4, for: .normal)
        }
        
        return cell
    }
    
}
