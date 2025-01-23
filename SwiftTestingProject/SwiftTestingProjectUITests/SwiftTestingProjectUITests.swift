//
//  SwiftTestingProjectUITests.swift
//  SwiftTestingProjectUITests
//
//  Created by Berk Canpolat on 23.01.2025.
//

import XCTest

final class SwiftTestingProjectUITests: XCTestCase {

    
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let addButton = app.navigationBars["SwiftTestingProject.View"].buttons["Item"]
        
        let elementsQuery = app.alerts["Add Item"].scrollViews.otherElements
        let textField = elementsQuery.collectionViews/*@START_MENU_TOKEN@*/.textFields["Enter Item"]/*[[".cells.textFields[\"Enter Item\"]",".textFields[\"Enter Item\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        let okButton = elementsQuery.buttons["OK"]
                
        
        addButton.tap()
        
        textField.tap()
        textField.typeText("Berk")
        okButton.tap()
        
        // Eklenen hücrenin varlığını bekleme
            let newCell = app.tables.cells.element(boundBy: 0)
            XCTAssertTrue(newCell.waitForExistence(timeout: 5), "Eklenen hücre bulunamadı.")
            
            // Hücreye tıklama
            newCell.tap()
    }
    
}
