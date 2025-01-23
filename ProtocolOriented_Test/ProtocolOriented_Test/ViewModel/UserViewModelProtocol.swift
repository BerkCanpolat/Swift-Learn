//
//  UserViewModelOutput.swift
//  ProtocolOriented_Test
//
//  Created by Berk Canpolat on 23.01.2025.
//

import Foundation

protocol UserViewModelProtocol : AnyObject {
    func updateView(name:String,email:String,userName:String)
}
