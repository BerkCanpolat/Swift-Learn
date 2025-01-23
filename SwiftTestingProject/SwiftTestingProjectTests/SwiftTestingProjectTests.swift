//
//  SwiftTestingProjectTests.swift
//  SwiftTestingProjectTests
//
//  Created by Berk Canpolat on 23.01.2025.
//

import XCTest
@testable import SwiftTestingProject

final class SwiftTestingProjectTests: XCTestCase {

    let mat = MathematicFunction()
    
    func testAddIntegerFunctions() {
        let result = mat.addIntegers(x: 10, y: 5)
        
        /// Doğruysa Test Geçecek Yanlışsa Geçmeyecek
        XCTAssertEqual(result, 15)
        //XCTAssertEqual(result, 15, "merhaba")
    }
    
    func testmultiplyNumbersFunctions() {
        let result = mat.multiplyNumbers(x: 5, y: 4)
        
        /// Doğruysa Test Geçecek Yanlışsa Geçmeyecek
        XCTAssertEqual(result, 20)
        //XCTAssertEqual(result, 15, "merhaba")
    }
    
    func testAdivideIntegersFunctions() {
        let result = mat.divideIntegers(x: 10, y: 2)
        
        /// Doğruysa Test Geçecek Yanlışsa Geçmeyecek
        XCTAssertEqual(result, 5)
        //XCTAssertEqual(result, 15, "merhaba")
    }

}
