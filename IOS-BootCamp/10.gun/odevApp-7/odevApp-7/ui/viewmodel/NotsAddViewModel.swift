//
//  NotsAddViewModel.swift
//  odevApp-7
//
//  Created by Berk Canpolat on 20.12.2023.
//

import Foundation
import RxSwift

class NotsAddViewModel {
    var notShowList = BehaviorSubject<[NotsModel]>(value: [NotsModel]())
    var nrepo = NotsDaoRepository()
    
    
    func notsAdd(nots_head:String,nots_content:String) {
        nrepo.notsAdded(nots_head: nots_head, nots_content: nots_content)
    }
    
}
