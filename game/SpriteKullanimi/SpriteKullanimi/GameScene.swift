//
//  GameScene.swift
//  SpriteKullanimi
//
//  Created by Berk Canpolat on 1.01.2024.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    
    //UYGULAMA İLK AÇILDIĞINDA ÇALIŞIR
    override func didMove(to view: SKView) {
        
    }
    
    
    //EKRANA DOKUNMA GERÇEKLEŞİRSE ÇALIŞIR
    func touchDown(atPoint pos : CGPoint) {

    }
    
    //HAREKETLİLİK SAĞLANIRSA ÇALIŞIR
    func touchMoved(toPoint pos : CGPoint) {
    }
    
    //DOKUNUP PARMAĞIMIZI KALDIRIRSAK ÇALIŞIR
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    
    //BURDAKİ FONKSİYONLAR SAYESİNDE YUKARIDAKİ FONKSİYONLARI ÇALIŞTIRABİLİYORUZ
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
    
    
    //SAYFA HER YENİLENDİĞİNDE BU METHOD ÇALIŞIR
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
