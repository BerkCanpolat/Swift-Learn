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
    var score = 0
    

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
    
    
    func cevaplariKaristir(question: QuestionModel) -> [String] {
        var options = [question.option_1, question.option_2, question.option_3, question.option_4]
        options.shuffle()
        return options.compactMap{$0}
    }
    
    func setupCell(cell: QuestionCell, with question: QuestionModel) {
        cell.questionLabel.text = question.question
        let shuffledOptions = cevaplariKaristir(question: question)
        cell.option1.setTitle(shuffledOptions[0], for: .normal)
        cell.option2.setTitle(shuffledOptions[1], for: .normal)
        cell.option3.setTitle(shuffledOptions[2], for: .normal)
        cell.option4.setTitle(shuffledOptions[3], for: .normal)
    }
    
    func dogruCevapKontrolu(question: QuestionModel, secilenCevap:String) {
        if let dogruCevap = question.correct_answer, secilenCevap == dogruCevap {
            score += 1
        } else {
            
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
            setupCell(cell: cell, with: item)
        }
        
        return cell
    }
    
}
