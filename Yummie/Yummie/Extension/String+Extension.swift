//
//  String+Extension.swift
//  Yummie
//
//  Created by Berk Canpolat on 26.01.2025.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
