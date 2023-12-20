//
//  NotsUpdateViewModel.swift
//  odevApp-7
//
//  Created by Berk Canpolat on 20.12.2023.
//

import Foundation
import RxSwift

class NotsUpdateViewModel {
    var nrepo = NotsDaoRepository()
    
    
    func notsUpdate(nots_head:String,nots_content:String,nots_id:Int) {
        nrepo.notsUpdate(nots_head: nots_head, nots_content: nots_content, nots_id: nots_id)
    }
    
}
