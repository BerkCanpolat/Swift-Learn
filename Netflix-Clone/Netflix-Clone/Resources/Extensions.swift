//
//  Extensions.swift
//  Netflix-Clone
//
//  Created by Berk Canpolat on 8.02.2025.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
