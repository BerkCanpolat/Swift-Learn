//
//  ViewControllerViewModel.swift
//  odevApp-7
//
//  Created by Berk Canpolat on 20.12.2023.
//

import Foundation
import RxSwift

class ViewControllerViewModel {
    var notsShowList = BehaviorSubject<[NotsModel]>(value: [NotsModel]())
    var nrepo = NotsDaoRepository()
    
    init() {
        veritabaniKopyala()
        notsShowList = nrepo.notsShowList
        notsShow()
    }
    
    func notsShow() {
        nrepo.notsShow()
    }
    
    func searchNots(search:String) {
        nrepo.searchNots(search: search)
    }
    
    func deleteNots(nots_id:Int) {
        nrepo.deleteNots(nots_id: nots_id)
    }
    
    func veritabaniKopyala() {
        let bundleYolu = Bundle.main.path(forResource: "rehberr", ofType: ".sqlite")
        let hedefYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(string: hedefYolu)!.appendingPathComponent("rehberr.sqlite")
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: kopyalanacakYer.path) {
            print("Veri tabanı zaten var")
        } else {
            do {
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            } catch {
                
            }
        }
    }

}
