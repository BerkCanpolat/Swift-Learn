//
//  NotsDaoRepository.swift
//  odevApp-7
//
//  Created by Berk Canpolat on 20.12.2023.
//

import Foundation
import RxSwift

class NotsDaoRepository {
    var notsShowList = BehaviorSubject<[NotsModel]>(value: [NotsModel]())
    
    
    let db: FMDatabase?
    
    init() {
        let hedefYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniUrl = URL(string: hedefYolu)!.appendingPathComponent("rehberr.sqlite")
        db = FMDatabase(path: veritabaniUrl.path)
    }
    
    
    
    
    func notsShow() {
        
        db?.open()
        
        var notsList = [NotsModel]()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM yenitablom", values: nil)
            
            while rs.next() {
                let nots = NotsModel(nots_content: rs.string(forColumn: "nots_content")!, nots_head: rs.string(forColumn: "nots_head")!, nots_id: Int(rs.string(forColumn: "nots_id"))!)
                
                notsList.append(nots)
            }
            
            notsShowList.onNext(notsList)
        } catch {
            print(error.localizedDescription)
        }
        

        db?.close()
    }
    
    func searchNots(search:String) {
        
        db?.open()
        
        var notsList = [NotsModel]()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM yenitablom WHERE nots_head like '%\(search)%'", values: nil)
            
            while rs.next() {
                let nots = NotsModel(nots_content: rs.string(forColumn: "nots_content")!, nots_head: rs.string(forColumn: "nots_head")!, nots_id: Int(rs.string(forColumn: "nots_id"))!)
                
                notsList.append(nots)
            }
            
            notsShowList.onNext(notsList)
        } catch {
            print(error.localizedDescription)
        }
        

        db?.close()    }
    
    func deleteNots(nots_id:Int) {
        db?.open()
        
        do {
            try db?.executeUpdate("DELETE FROM yenitablom WHERE nots_id = ?", values: [nots_id])
            notsShow()
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func notsAdded(nots_head:String,nots_content:String) {
        db?.open()
        
        do {
            try db?.executeUpdate("INSERT INTO yenitablom (nots_head,nots_content) VALUES (?,?)", values: [nots_head,nots_content])
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func notsUpdate(nots_head:String,nots_content:String,nots_id:Int) {
        db?.open()
        
        do {
            try db?.executeUpdate("UPDATE yenitablom SET nots_head = ?,nots_content = ? WHERE nots_id = ?", values: [nots_head,nots_content,nots_id])
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
