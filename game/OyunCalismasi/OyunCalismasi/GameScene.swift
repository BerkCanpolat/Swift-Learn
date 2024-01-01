//
//  GameScene.swift
//  OyunCalismasi
//
//  Created by Berk Canpolat on 1.01.2024.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    
    var anakarakter:SKSpriteNode = SKSpriteNode()
    var siyahkare:SKSpriteNode = SKSpriteNode()
    var saridaire:SKSpriteNode = SKSpriteNode()
    var kirmiziucgen:SKSpriteNode = SKSpriteNode()
    
    var skorLabel:SKLabelNode = SKLabelNode()
    
    var viewController:UIViewController?
    
    var dokunmaKontrol = false
    var oyunBaslangicKontrol = false
    var sayici:Timer?
    
    var ekranGenisligi:Int?
    var ekranYuksekligi:Int?
    
    override func didMove(to view: SKView) {
        
        ekranGenisligi = Int(self.size.width)
        ekranYuksekligi = Int(self.size.height)
        
        print("Ekran Genişliği: \(ekranGenisligi!)")
        print("Ekran Yuksekliği: \(ekranYuksekligi!)")
        
        if let tempKarakter = self.childNode(withName: "anakarakter") as? SKSpriteNode {
            anakarakter = tempKarakter
        }
        
        if let tempKarakter = self.childNode(withName: "siyahkare") as? SKSpriteNode {
            siyahkare = tempKarakter
        }
        
        if let tempKarakter = self.childNode(withName: "saridaire") as? SKSpriteNode {
            saridaire = tempKarakter
        }
        
        if let tempKarakter = self.childNode(withName: "kirmiziucgen") as? SKSpriteNode {
            kirmiziucgen = tempKarakter
        }
        
        if let tempKarakter = self.childNode(withName: "skorLabel") as? SKLabelNode {
            skorLabel = tempKarakter
            skorLabel.text = "Skor: 0"
        }
        
        sayici = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(GameScene.hareket), userInfo: nil, repeats: true)

    }
    
    @objc func hareket() {
        if oyunBaslangicKontrol {
            if dokunmaKontrol {
                let yukariHareket:SKAction = SKAction.moveBy(x: 0, y: +20, duration: 1)
                anakarakter.run(yukariHareket)
            } else {
                let asagiHareket:SKAction = SKAction.moveBy(x: 0, y: -20, duration: 1)
                anakarakter.run(asagiHareket)
            }
            
            cisimlerinSerbestHareketi(cisimAdi: siyahkare, cisimHizi: -15)
            cisimlerinSerbestHareketi(cisimAdi: saridaire, cisimHizi: -10)
            cisimlerinSerbestHareketi(cisimAdi: kirmiziucgen, cisimHizi: -20)

        }
    }
    
    
    func cisimlerinSerbestHareketi(cisimAdi:SKSpriteNode, cisimHizi:CGFloat) {
        if Int(cisimAdi.position.x) < 0 {
            cisimAdi.position.x = CGFloat(ekranGenisligi! + 20)
            
            cisimAdi.position.y = -CGFloat(arc4random_uniform(UInt32(ekranYuksekligi!)))
        } else {
            let solaHareket:SKAction = SKAction.moveBy(x: cisimHizi, y: 0, duration: 6)
            cisimAdi.run(solaHareket)
        }
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        print("Ekrana dokunuldu")
        
        dokunmaKontrol = true
        
        oyunBaslangicKontrol = true

        //self.viewController?.performSegue(withIdentifier: "oyunTosonuc", sender: nil)

    }
    
    func touchMoved(toPoint pos : CGPoint) {
        print("ekran üzerinde hareket etti")

    }
    
    func touchUp(atPoint pos : CGPoint) {
        print("Ekran Bırakıldı")
        
        dokunmaKontrol = false

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
