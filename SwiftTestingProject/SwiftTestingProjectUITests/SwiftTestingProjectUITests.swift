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
        let addedCell = app.tables.cells.containing(.staticText, identifier: "berk").element
        
        let okButton = elementsQuery.buttons["OK"]
        
        addButton.tap()
        
        textField.tap()
        textField.typeText("berk")
        okButton.tap()
        
        XCTAssertTrue(addedCell.exists)
    }
    
    func testDelete() throws {
        
        let app = XCUIApplication()
        app.launch()
        let addButton = app.navigationBars["SwiftTestingProject.View"].buttons["Item"]
        let elementsQuery = app.alerts["Add Item"].scrollViews.otherElements
        let textField = elementsQuery.collectionViews.textFields["Enter Item"]
        //textField.tap()
        //textField.typeText("berk")
                
        let okButton = elementsQuery.buttons["OK"]
        
        let addedCell = app.tables.cells.containing(.staticText, identifier: "berk").element
        
        

        let tablesQuery = app.tables
        let deleteButton = tablesQuery.buttons["Delete"]
        
        addButton.tap()
        
        textField.tap()
        textField.typeText("berk")
        okButton.tap()
        
        addedCell.swipeLeft()
        deleteButton.tap()
        
        XCTAssertFalse(addedCell.exists)
        
    }
    
}
