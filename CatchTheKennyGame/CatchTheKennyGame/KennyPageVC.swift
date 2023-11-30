//
//  KennyPageVC.swift
//  CatchTheKennyGame
//
//  Created by Berk Canpolat on 23.11.2023.
//

import UIKit

class KennyPageVC: UIViewController {
    
    
    //MARK: - UIElements
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var namekenyyLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    @IBOutlet weak var kenny1: UIImageView!
    @IBOutlet weak var kenny2: UIImageView!
    @IBOutlet weak var kenny3: UIImageView!
    @IBOutlet weak var kenny4: UIImageView!
    @IBOutlet weak var kenny5: UIImageView!
    @IBOutlet weak var kenny6: UIImageView!
    @IBOutlet weak var kenny7: UIImageView!
    @IBOutlet weak var kenny8: UIImageView!
    @IBOutlet weak var kenny9: UIImageView!
    
    
    //MARK: - Propertys
    var homeName = ""
    var score = 0
    var timeCount = 10
    var time = Timer()
    var hideKenyy = [UIImageView]()
    var hidekenyyTimer = Timer()
    var highScore = 0
    
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        namekenyyLabel.text = "İsim: \(homeName)"
        
        kenny1.isUserInteractionEnabled = true
        kenny2.isUserInteractionEnabled = true
        kenny3.isUserInteractionEnabled = true
        kenny4.isUserInteractionEnabled = true
        kenny5.isUserInteractionEnabled = true
        kenny6.isUserInteractionEnabled = true
        kenny7.isUserInteractionEnabled = true
        kenny8.isUserInteractionEnabled = true
        kenny9.isUserInteractionEnabled = true
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(self.scoreCount))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(self.scoreCount))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(self.scoreCount))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(self.scoreCount))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(self.scoreCount))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(self.scoreCount))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(self.scoreCount))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(self.scoreCount))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(self.scoreCount))
        
        kenny1.addGestureRecognizer(recognizer1)
        kenny2.addGestureRecognizer(recognizer2)
        kenny3.addGestureRecognizer(recognizer3)
        kenny4.addGestureRecognizer(recognizer4)
        kenny5.addGestureRecognizer(recognizer5)
        kenny6.addGestureRecognizer(recognizer6)
        kenny7.addGestureRecognizer(recognizer7)
        kenny8.addGestureRecognizer(recognizer8)
        kenny9.addGestureRecognizer(recognizer9)
        
        scoreLabel.text = "Score: \(score)"
        
        timeCount = 10
        timeLabel.text = "Time: \(timeCount)"
        
        time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timeCounter), userInfo: nil, repeats: true)
        
        
        hideKenyy = [kenny1,kenny2,kenny3,kenny4,kenny5,kenny6,kenny7,kenny8,kenny9]
        
        hidekeniFunc()
        
        hidekenyyTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.hidekeniFunc), userInfo: nil, repeats: true)
        
        let yuksekPuanTut = UserDefaults.standard.object(forKey: "yuksekPuan")
        
        if yuksekPuanTut == nil {
            highScore = 0
            highScoreLabel.text = "HighScore: \(highScore)"
        }
        
        if let newScore = yuksekPuanTut as? Int {
            highScore = newScore
            highScoreLabel.text = "HighScore: \(highScore)"
        }
        

    }
    
    
    //MARK: - Actions
    @objc func hidekeniFunc() {
        for i in hideKenyy {
            i.isHidden = true
        }
        
        let random = Int(arc4random_uniform(UInt32(hideKenyy.count - 1)))
        hideKenyy[random].isHidden = false
    }
    
    @objc func timeCounter() {
        timeCount -= 1
        timeLabel.text = "Time: \(timeCount)"
        
        if timeCount == 0 {
            time.invalidate()
            hidekenyyTimer.invalidate()
            
            
            for i in hideKenyy {
                i.isHidden = true
            }
            
            
            if self.score > self.highScore {
                self.highScore = self.score
                
                self.highScoreLabel.text = "HighScore: \(self.highScore)"
                
                UserDefaults.standard.set(self.highScore, forKey: "yuksekPuan")
            }
            
            
            
            //ALERT
            let alert = UIAlertController(title: "UYARI!", message: "Oyun bitti. Tekrar Oynamak İster Misin?", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "Evet", style: UIAlertAction.Style.default) { UIAlertAction in
                
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                
                self.timeCount = 10
                self.timeLabel.text = "Time: \(self.timeCount)"
                
                self.time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timeCounter), userInfo: nil, repeats: true)
                self.hidekenyyTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.hidekeniFunc), userInfo: nil, repeats: true)
                
                
                
            }
            let cancelButton = UIAlertAction(title: "Hayır", style: UIAlertAction.Style.destructive)
            alert.addAction(okButton)
            alert.addAction(cancelButton)
            present(alert, animated: true, completion: nil)
            
            
        }
        
        
    }
    
    @objc func scoreCount() {
        
        score += 1
        
        scoreLabel.text = "Score: \(score)"
        
    }
    
    
    
    @IBAction func silButton(_ sender: Any) {
        
        let yuksekPuanTut = UserDefaults.standard.object(forKey: "yuksekPuan")
        
        if (yuksekPuanTut as? Int) != nil {
            UserDefaults.standard.removeObject(forKey: "yuksekPuan")
            highScore = 0
            highScoreLabel.text = "HighScore: \(highScore)"
        }
        
    }
    
    
}
